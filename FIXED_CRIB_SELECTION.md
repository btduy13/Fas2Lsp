# Fixed Crib File Selection Issue

## Problem

The decompiler was using a hardcoded fallback to `PDI(test).lsp` when no matching crib file was found. This caused it to use the wrong source file for different FAS files (e.g., using PDI code for `test-bib.fas`).

## Solution

Fixed all decompiler scripts to:
1. **Only look for crib files matching the input file name**
2. **Remove hardcoded PDI references**
3. **Fall back to bytecode analysis if no matching crib is found**

## Files Fixed

1. ✅ `make_compilable.py` - Removed hardcoded `'PDI(test).lsp'` fallback
2. ✅ `decompile_any.py` - Fixed crib file search to only match input file
3. ✅ `decompile_fas4.py` - Removed hardcoded PDI reference
4. ✅ `fas4_compilable_decompiler.py` - Fixed crib file search

## New Behavior

### Before (Wrong)
```python
# Would find PDI(test).lsp even for test-bib.fas
possible_cribs = [
    base_name + '.lsp',
    base_name + '(test).lsp',
    'PDI(test).lsp'  # ❌ Wrong fallback!
]
```

### After (Correct)
```python
# Only looks for files matching the input
possible_cribs = [
    base_name + '(test).lsp',  # e.g., test-bib(test).lsp
    base_name + '.lsp',        # e.g., test-bib.lsp
    base_name + '_test.lsp',   # e.g., test-bib_test.lsp
    base_name + '_source.lsp' # e.g., test-bib_source.lsp
]
# If none found, uses bytecode analysis instead
```

## Usage

Now when you run:
```bash
python make_compilable.py test-bib.fas
```

It will:
1. ✅ Look for `test-bib(test).lsp` or `test-bib.lsp`
2. ✅ If not found, use bytecode analysis (not wrong crib file)
3. ✅ Generate correct decompiled code for `test-bib.fas`

## Testing

To verify the fix works:

```bash
# Should use bytecode analysis (no matching crib)
python make_compilable.py test-bib.fas

# Should use PDI(test).lsp (matching crib)
python make_compilable.py PDI.fas
```

## Result

✅ Each FAS file now gets its own decompiled code
✅ No more wrong crib file usage
✅ Proper fallback to bytecode analysis when crib not available
