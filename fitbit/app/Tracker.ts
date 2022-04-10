import exercise, { Exercise } from "exercise";
import User from "../domain/entity/user";
import document from "document";
import UserState from "../domain/entity/user_state";

type TrackerParameters = {
    user: User,
    callback?: (state: UserState) => void
    onStop?: () => void
}

export default class Tracker {
    protected user: User;
    protected callback: (state: UserState) => void;
    private onStop: () => void;
    private startButton: Element = document.getElementById("button--start");
    private relativeSpeed: Element = document.getElementById("relative-speed");
    private timer: number;

    constructor(parameters: TrackerParameters) {
        this.user = parameters.user;
        this.callback = parameters.callback;
        this.onStop = parameters.onStop;
    }

    start = (): void => {
        if (exercise.state != "started") {
            exercise.start("run", { gps: true });
        }        

        if(this.timer == null) {
            this.timer = setInterval(this.handleTick, 1000);
        }

        this.startButton.text = "Stop";
        this.startButton.onclick = this.stop;

    }

    stop = (): void => {
        clearInterval(this.timer);
        this.timer = null;
        this.relativeSpeed.text = "";
        this.startButton.text = "Start";
        this.startButton.onclick = this.start;
        if(exercise) {
            exercise.stop();
        }
        if(this.onStop) {
            this.onStop();
        }
    }

    handleTick = (): void => {
       if (exercise && exercise.stats && exercise.state == "started") {
            this.user.walk(exercise.stats.steps);
            if (this.callback != null) {
                this.callback(this.user.state);
            }
        }
    }
}