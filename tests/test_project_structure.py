from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def test_godot_vertical_slice_files_exist():
    for relative in ("project.godot", "main.tscn", "main.gd", "GDD.md"):
        assert (ROOT / relative).is_file(), relative


def test_core_loop_signals_are_present():
    code = (ROOT / "main.gd").read_text(encoding="utf-8")
    for signal in ("Input.get_vector", "score += 1", "level = 1 + score / 5", "time_left", "restart"):
        assert signal in code, signal


def test_decision_records_validation_dimensions():
    adr = (ROOT / "planning" / "decisions" / "ADR-0001-core-loop.md").read_text(encoding="utf-8")
    for label in ("Segurança:", "Performance:", "Acessibilidade:", "Testes:"):
        assert label in adr, label
