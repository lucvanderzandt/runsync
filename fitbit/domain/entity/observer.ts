import UserState from "./user_state";

export default interface Observer {
    update(state: UserState): void;
}