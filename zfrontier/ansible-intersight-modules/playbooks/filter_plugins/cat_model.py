def cat_strip_nulls(v):
    if isinstance(v, dict):
        return {k: cat_strip_nulls(x) for k, x in v.items() if x is not None}
    if isinstance(v, list):
        return [cat_strip_nulls(x) for x in v if x is not None]
    return v

class FilterModule:
    def filters(self):
        return {"cat_strip_nulls": cat_strip_nulls}
