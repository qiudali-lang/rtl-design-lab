"""Technology-neutral Elmore delay helpers for a ripple path."""

from dataclasses import dataclass


@dataclass(frozen=True)
class Stage:
    resistance_ohm: float
    capacitance_f: float

    def __post_init__(self):
        if self.resistance_ohm <= 0 or self.capacitance_f <= 0:
            raise ValueError("R and C must be positive")


def elmore_delay(stages: list[Stage]) -> float:
    """Return Elmore delay in seconds for a simple RC ladder."""
    downstream_cap = 0.0
    delay = 0.0
    for stage in reversed(stages):
        downstream_cap += stage.capacitance_f
        delay += stage.resistance_ohm * downstream_cap
    return delay


def main() -> None:
    path = [Stage(2_000, 3e-15), Stage(1_500, 8e-15), Stage(1_000, 20e-15)]
    print(f"Elmore delay: {elmore_delay(path) * 1e12:.2f} ps")


if __name__ == "__main__":
    main()

