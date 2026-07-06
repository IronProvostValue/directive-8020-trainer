import numpy as np

def compute_compliance_score(policy: np.ndarray, reference: np.ndarray) -> float:
    """
    Compute cosine similarity between current policy and reference gradient.
    Returns value in [0, 1] (clipped) — 1 means fully compliant.
    """
    dot = np.dot(policy.flatten(), reference.flatten())
    norm = np.linalg.norm(policy) * np.linalg.norm(reference)
    if norm == 0:
        return 0.0
    return float(np.clip(dot / norm, 0.0, 1.0))