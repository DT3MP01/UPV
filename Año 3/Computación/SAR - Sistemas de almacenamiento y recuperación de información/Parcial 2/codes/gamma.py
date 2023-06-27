#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author: Overxfl0w13 #
# Gamma encoding #

import functools as func


def gamma_encoding(postings): return "".join(
    [get_length(get_offset(gap))+get_offset(gap) for gap in get_gaps_list(postings)])


def gamma_decoding2(gamma):
    _, length, offset, aux, res = 0, "", "", 0, []
    while gamma != "":
        aux = gamma.find("0")
        length = gamma[:aux]
        if length == "":
            res.append(1)
            gamma = gamma[1:]
        else:
            offset = '1' + gamma[aux+1:aux+1+int(unary_decodification(length))]
            res.append(int(offset, 2))
            gamma = gamma[aux+1+int(unary_decodification(length)):]
    return res

def gamma_decoding(gamma):
	_, length, offset, aux, res = 0, "", "", 0, []
	while gamma != "":
		aux = gamma.find("0")
		length = gamma[:aux]
	if length == "":
		res.append(1)
		gamma = gamma[1:]
	else:
		offset = "1" + str(gamma[aux+1:aux+1+unary_decodification(length)])
		res.append(int(offset, 2))
		gamma = gamma[aux+1+unary_decodification(length):]
	return res


def get_offset(gap): return bin(gap)[3:]


def get_length(offset): return unary_codification(len(offset))+"0"


def unary_codification(gap): return "".join(["1" for _ in range(gap)])


def unary_decodification(gap): return func.reduce(
    lambda x, y: int(x)+int(y), list(gap))


def get_gaps_list(posting_lists): return [
    posting_lists[0]]+[posting_lists[i]-posting_lists[i-1] for i in range(1, len(posting_lists))]


print('Gamma encoding:')

postingList = [7, 12, 13, 16, 20, 26, 34, 35, 43]

gaps = postingList.copy()
for i in range(len(gaps) - 1):
    gaps[i + 1] = postingList[i + 1] - postingList[i]

print('Codified values (gaps):', gaps)

encoding = gamma_encoding(postingList)
print(encoding)

examStatement = '11011 11001 0 101 11000 11010 1110000 0 1110000'.replace(
    " ", '')

print("Checking if the result is the same as the statement in the exam:",
      encoding == examStatement)

print('\n', '------', '\n')

print('Gamma decoding:', gamma_decoding2('11011 11001 0 101 11000 11010 1110000 0 1110000'.replace(' ', '')))