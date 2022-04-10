import Observer from "./observer";

export default interface Observeable {
    attach(observer: Observer): void;

    detach(observer: Observer): void;

    notify(): void;
}