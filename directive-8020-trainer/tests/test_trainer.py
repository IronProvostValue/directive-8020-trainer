import numpy as np
from src import Directive8020Trainer, compute_compliance_score

def test_initial_compliance():
    baseline = np.array([1.0, 0.0, -1.0])
    trainer = Directive8020Trainer(baseline)
    assert trainer.get_compliance_rate() == 0.0

def test_compliance_score_identity():
    a = np.array([2.0, 3.0])
    score = compute_compliance_score(a, a)
    assert score == 1.0

def test_compliance_score_orthogonal():
    a = np.array([1.0, 0.0])
    b = np.array([0.0, 1.0])
    score = compute_compliance_score(a, b)
    assert score == 0.0

def test_train_step_compliant():
    baseline = np.array([0.5, -0.5])
    trainer = Directive8020Trainer(baseline, learning_rate=0.1)
    grad = np.array([0.1, -0.1])
    score = trainer.train_step(grad, explore=False)
    assert 0.0 <= score <= 1.0
    assert trainer.get_compliance_rate() > 0.0

def test_train_step_explore():
    baseline = np.array([0.5, -0.5])
    trainer = Directive8020Trainer(baseline, learning_rate=0.1)
    grad = np.array([0.1, -0.1])
    score = trainer.train_step(grad, explore=True)
    assert 0.0 <= score <= 1.0

def test_multiple_steps():
    baseline = np.array([1.0, 1.0])
    trainer = Directive8020Trainer(baseline)
    for i in range(10):
        grad = np.random.randn(2) * 0.5
        trainer.train_step(grad, explore=(i % 5 == 0))
    rate = trainer.get_compliance_rate()
    assert 0.0 <= rate <= 1.0