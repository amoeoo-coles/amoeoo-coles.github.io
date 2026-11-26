# Filter used by the catalogue playbooks. cat_strip_nulls removes null values
# recursively (and containers left empty), so a model can list every documented
# key while only keys with values reach the module.


def _strip(v):
    if isinstance(v, dict):
        o = {k: x for k, x in ((k, _strip(x)) for k, x in v.items()) if x is not None}
        return o or None
    if isinstance(v, list):
        o = [x for x in (_strip(x) for x in v) if x is not None]
        return o or None
    return v


class FilterModule(object):
    def filters(self):
        return {"cat_strip_nulls": _strip}
