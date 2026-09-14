"""Small LRU set-associative cache model."""

from dataclasses import dataclass
from typing import Iterable


@dataclass
class CacheStats:
    hits: int = 0
    misses: int = 0

    @property
    def accesses(self) -> int:
        return self.hits + self.misses

    @property
    def hit_rate(self) -> float:
        return self.hits / self.accesses if self.accesses else 0.0


class SetAssociativeCache:
    def __init__(self, capacity_bytes: int, line_bytes: int, ways: int):
        if min(capacity_bytes, line_bytes, ways) <= 0:
            raise ValueError("cache parameters must be positive")
        if capacity_bytes % (line_bytes * ways):
            raise ValueError("capacity must be divisible by line_bytes * ways")
        self.line_bytes = line_bytes
        self.ways = ways
        self.num_sets = capacity_bytes // (line_bytes * ways)
        if self.num_sets & (self.num_sets - 1):
            raise ValueError("number of sets must be a power of two")
        self.sets: list[list[int]] = [[] for _ in range(self.num_sets)]
        self.stats = CacheStats()

    def access(self, address: int) -> bool:
        if address < 0:
            raise ValueError("address must be non-negative")
        block = address // self.line_bytes
        set_index = block % self.num_sets
        tag = block // self.num_sets
        ways = self.sets[set_index]
        if tag in ways:
            ways.remove(tag)
            ways.insert(0, tag)
            self.stats.hits += 1
            return True
        self.stats.misses += 1
        ways.insert(0, tag)
        if len(ways) > self.ways:
            ways.pop()
        return False

    def run(self, addresses: Iterable[int]) -> CacheStats:
        for address in addresses:
            self.access(address)
        return self.stats

