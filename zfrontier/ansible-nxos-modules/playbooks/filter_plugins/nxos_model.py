# Filter used by the cisco.nxos catalogue playbooks.
# nxos_strip_nulls removes null (None) values recursively, and containers that end
# up empty, so model files can list every documented key while only the keys
# that have values are sent to the module.


def _strip(value):
    """Drop None values; containers left empty become None and are dropped too."""
    if isinstance(value, dict):
        out = {}
        for k, v in value.items():
            v = _strip(v)
            if v is not None:
                out[k] = v
        return out or None
    if isinstance(value, list):
        out = [x for x in (_strip(v) for v in value) if x is not None]
        return out or None
    return value


class FilterModule(object):
    def filters(self):
        return {"nxos_strip_nulls": _strip}
