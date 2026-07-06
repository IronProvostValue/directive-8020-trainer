import numpy as np
from .metrics import compute_compliance_score

class Directive8020Trainer:
    """
    Simulates training of a model under Directive 8020 constraints:
    - 80% of updates must comply with a baseline policy.
    - 20% can explore novel actions.
    """
    def __init__(self, baseline_policy: np.ndarray, learning_rate: float = 0.01):
        self.policy = baseline_policy.copy()
        self.lr = learning_rate
        self.history = []

    def train_step(self, gradient: np.ndarray, explore: bool = False) -> float:
        if explore:
            noise = np.random.randn(*self.policy.shape) * 0.1
            update = gradient + noise
        else:
            update = gradient

        self.policy -= self.lr * update
        score = compute_compliance_score(self.policy, gradient)
        self.history.append(score)
        return score

    def get_compliance_rate(self) -> float:
        if not self.history:
            return 0.0
        return np.mean(self.history)