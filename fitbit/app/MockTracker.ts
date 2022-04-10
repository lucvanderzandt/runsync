import Tracker from "./Tracker";

export default class MockTracker extends Tracker {
    private readonly speed: number = 1.4; // steps per second
    private steps: number = 0;

    handleTick = (): void => {
        this.steps += this.speed;
        this.user.walk(this.steps);
        if (this.callback != null) {
            this.callback(this.user.state);
        }
    }
}
