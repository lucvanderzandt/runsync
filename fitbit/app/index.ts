import document from "document";
import User from "../domain/entity/user";
import UserState, { RelativeProgress } from "../domain/entity/user_state";
import MockTracker from "./MockTracker";
import Tracker from "./Tracker";
import { vibration } from "haptics";

let relativeSpeed = document.getElementById("relative-speed");
let me = new User();
let friend = new User();
me.attach(friend);
friend.attach(me);

document.getElementById("button--start").onclick = start;

function start() {
    let mock = new MockTracker({
        user: friend,
    });
    let user = new Tracker({
        user: me,
        callback: function (state: UserState) {
            if (state.progress === RelativeProgress.Behind) {
                relativeSpeed.text = `You are behind!`;
                vibration.start("alert");
                setTimeout(() => {
                    vibration.stop();
                }, 1000);

            } else if (state.progress === RelativeProgress.Ahead) {
                relativeSpeed.text = `You are ahead!`;
                vibration.start("nudge");
                setTimeout(() => {
                    vibration.stop();
                }, 500);
            } else
                relativeSpeed.text = `You're walking together!`;
        },
        onStop: function () {
            mock.stop();
        }
    });
    user.start();
    mock.start();
}