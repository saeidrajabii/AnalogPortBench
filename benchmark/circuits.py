"""Benchmark circuits: which testbenches each one uses, and with which parameters.

Each circuit lives in benchmark/circuits/<name>/:
  source_180n.sp   the original design (DUT subcircuit `dut`), TSMC 0.18 um
  spec.yaml        metric limits derived from the source design (make_specs.py)
  ported/          Sky130 versions (naive baselines, LLM outputs, ...)

The `dut` port list is fixed per circuit class, so the same testbench works in any technology.
"""
CIRCUITS = {
    "cm_simple": {
        "description": "Simple NMOS current mirror, 1:1, Iref = 20 uA",
        "ports": "in out",
        "testbenches": {"mirror_dc": {"IREF_uA": 20}},
    },
    "cm_cascode": {
        "description": "NMOS cascode current mirror (stacked diodes), 1:1, Iref = 20 uA",
        "ports": "in out",
        "testbenches": {"mirror_dc": {"IREF_uA": 20}},
    },
    "cascode_bias": {
        "description": "Cascode bias generator (Vbias1..4) driving a PMOS cascode source and NMOS cascode sink",
        "ports": "iin out vb1 vb2 vb3 vb4",
        "testbenches": {"cascode_bias_dc": {"IREF_uA": 20}},
    },
    "ota_5t": {
        "description": "5-transistor NMOS-input OTA with cascode bias generator, CL = 1 pF",
        "ports": "iref inp inn out",
        "testbenches": {"ota_ol_ac": {"IREF_uA": 20, "VCM": 0.5, "CL": "1p"}},
    },
    "opamp_2stg": {
        "description": "Two-stage Miller OTA (Cc = 500 fF, Rz = 3 kOhm), cascoded tails, follower, CL = 1 pF",
        "ports": "iref inp inn out",
        "testbenches": {"opamp_loop": {"IREF_uA": 20, "VCM": 0.9, "CL": "1p"},
                        "opamp_tran": {"IREF_uA": 20, "VCM": 0.9, "CL": "1p", "VSTEP": 0.2}},
    },
    "ota_tele": {
        "description": "Single-ended telescopic cascode OTA, PMOS low-voltage cascode mirror load, CL = 1 pF",
        "ports": "iref inp inn out",
        "testbenches": {"opamp_loop": {"IREF_uA": 20, "VCM": "VDD/2", "CL": "1p"},
                        "opamp_tran": {"IREF_uA": 20, "VCM": "VDD/2", "CL": "1p", "VSTEP": 0.2},
                        "ota_swing_dc": {"IREF_uA": 20, "VCM": "VDD/2"}},
    },
    # advisor's newer designs with the wide-swing cascode bias (benchmark/import_180n_sources.py)
    "cascode_bias_ws": {
        "description": "Wide-swing cascode bias generator (Vbias1..4) driving a PMOS cascode source and NMOS cascode sink",
        "ports": "iin out vb1 vb2 vb3 vb4",
        "testbenches": {"cascode_bias_dc": {"IREF_uA": 20}},
    },
    "opamp_2stg_ws": {
        "description": "Two-stage Miller opamp with wide-swing cascode bias (newer opamp_2stg), CL = 1 pF",
        "ports": "iref inp inn out",
        "testbenches": {"opamp_loop": {"IREF_uA": 20, "VCM": 0.9, "CL": "1p"},
                        "opamp_tran": {"IREF_uA": 20, "VCM": 0.9, "CL": "1p", "VSTEP": 0.2}},
    },
    "ota_tele_ws": {
        "description": "Telescopic OTA with replica-biased cascodes and wide-swing cascode bias, CL = 1 pF",
        "ports": "iref inp inn out",
        "testbenches": {"ota_ol_ac": {"IREF_uA": 20, "VCM": "VDD/2", "CL": "1p"},
                        "opamp_tran": {"IREF_uA": 20, "VCM": "VDD/2", "CL": "1p", "VSTEP": 0.2},
                        "ota_swing_dc": {"IREF_uA": 20, "VCM": "VDD/2"}},
    },
    "ota_fc_ws": {
        "description": "Folded-cascode OTA with wide-swing cascode bias, CL = 1 pF",
        "ports": "iref inp inn out",
        "testbenches": {"ota_ol_ac": {"IREF_uA": 20, "VCM": "VDD/2", "CL": "1p"},
                        "opamp_tran": {"IREF_uA": 20, "VCM": "VDD/2", "CL": "1p", "VSTEP": 0.2},
                        "ota_swing_dc": {"IREF_uA": 20, "VCM": "VDD/2"}},
    },
}
