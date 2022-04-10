// This class represents a user within the Fitbit application. It implements the
// Observer pattern in order to simulate a server push API to get other's
// state data from.

import Observeable from "./observeable";
import Observer from "./observer";
import UserState, { RelativeProgress } from "./user_state";

export default class User implements Observeable, Observer {
    private observers: Observer[] = [];
    public state: UserState;

    constructor() {
        this.state = new UserState();
    }

    attach(observer: Observer): void {
        const index = this.observers.indexOf(observer);
        if(index > -1) {
            throw new Error("Observer already attached.");
        } else {
            this.observers.push(observer);
        }
    }

    detach(observer: Observer): void {
        const index = this.observers.indexOf(observer);
        if (index === -1) {
            throw new Error("Observer not attached.");
        } else {
            this.observers.splice(index, 1);
        }
    }

    update(state: UserState): void {
        const mySteps = this.state.steps;
        const otherSteps = state.steps;
        const diff = mySteps - otherSteps;
        if(diff > 7) {
            this.state.progress = RelativeProgress.Ahead;
        } else if(diff < -7) {
            this.state.progress = RelativeProgress.Behind;
        } else {
            this.state.progress = RelativeProgress.Synced;
        }
    }

    notify(): void {
        for (const observer of this.observers) {
            observer.update(this.state);
        }
    }

    walk(steps: number): void {
        this.state.steps = steps;
        this.notify();
    }
}