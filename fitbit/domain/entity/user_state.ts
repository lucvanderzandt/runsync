export default class UserState {
    public steps: number = 0;
    public progress: RelativeProgress;
}


export enum RelativeProgress {
    Behind,
    Ahead,
    Synced,
}