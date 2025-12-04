#!/usr/bin/env python3
"""Check the exact file structure."""

data = open('PDI.fas', 'rb').read()
print('File structure:')
print(repr(data[:100]))
print('\nLooking for size line...')
lines = data.split(b'\n')
for i, line in enumerate(lines[:5]):
    print(f'Line {i}: {repr(line)}')

print('\n\nTrying to find where data actually starts...')
# Find FAS4-FILE
fas4_pos = data.find(b'FAS4-FILE')
print(f'FAS4-FILE at: {fas4_pos}')

# Find the newline after FAS4-FILE line
after_header = data.find(b'\n', fas4_pos) + 1
if after_header < len(data) and data[after_header-1] == ord('\r'):
    # Skip \r\n
    if after_header < len(data) and data[after_header] == ord('\n'):
        after_header += 1

print(f'After header (offset {after_header}): {repr(data[after_header:after_header+50])}')

# The size should be on the next line
size_line_end = data.find(b'\n', after_header)
if size_line_end == -1:
    size_line_end = len(data)
size_line = data[after_header:size_line_end]
print(f'Size line: {repr(size_line)}')

# After size line
data_start = size_line_end + 1
if data_start < len(data) and data[data_start-1] == ord('\r'):
    if data_start < len(data) and data[data_start] == ord('\n'):
        data_start += 1

print(f'Data starts at offset {data_start}: {repr(data[data_start:data_start+50])}')

