# vim:fileencoding=utf8
from __future__ import division
from struct import pack, unpack
from bitstring import BitArray
import sys
import numpy as np

def encode_number(number):
    """Variable byte code encode number.
    Usage:
      import vbcode
      vbcode.encode_number(128)
    """
    bytes_list = []
    while True:
        bytes_list.insert(0, number % 128)
        if number < 128:
            break
        number = number // 128
    bytes_list[-1] += 128
    return pack('%dB' % len(bytes_list), *bytes_list)


def encode(numbers):
    """Variable byte code encode numbers.
    Usage:
      import vbcode
      vbcode.encode([32, 64, 128])
    """
    bytes_list = []
    for number in numbers:
        bytes_list.append(encode_number(number))
    return b"".join(bytes_list)


def decode(bytestream):
    """Variable byte code decode.
    Usage:
      import vbcode
      vbcode.decode(bytestream)
        -> [32, 64, 128]
    """
    n = 0
    numbers = []
    bytestream = unpack('%dB' % len(bytestream), bytestream)
    for byte in bytestream:
        if byte < 128:
            n = 128 * n + byte
        else:
            n = 128 * n + (byte - 128)
            numbers.append(n)
            n = 0
    return numbers

# Bits to posting list
s = '00000001 00010100 10001101 00000110 10010100 10001010'.replace(' ', '')
sToB = bytes(int(s[i:i+8], 2) for i in range(0, len(s), 8))
gaps = decode(sToB)

print('\nCodified values (gaps):', gaps)

postingList = gaps
for i in range(len(gaps) - 1):
    postingList[i + 1] = postingList[i] + postingList[i + 1]

print('Posting list:', postingList)

print('\n-------', '\n')

# Posting list to bits

examPosting = [84, 92, 277, 576]
examGaps = examPosting.copy()
for i in range(len(examGaps) - 1):
    examGaps[i + 1] = examPosting[i + 1] - examPosting[i]

print('Gaps:', examGaps)
encoded = encode(examGaps)

for my_byte in encoded:
    print(f'{my_byte:0>8b}', end=' ')
