#!/usr/bin/env python3
# Usage: py sc.py preferences.csv -m borda
# Usage: py sc.py preferences.csv -m plurality
# Usage: py sc.py preferences.csv -m condorcet
# Usage: py sc.py preferences.csv -m elimination
# Usage: py sc.py preferences.csv -m runoff

import argparse
import copy
import csv
import os
import sys


class InputError(Exception):

    def __init__(self, msg):
        self.msg = msg

    def __str__(self):
        return repr(self.msg)


class PreferenceSchedule():

    def __init__(self, candidates, prefs):
        # check whether the candidates list consists of only strings
        if not all(map(lambda x: type(x) == str, candidates)):
            raise InputError('Candidate must be a string')

        # check the validity of the preferences
        for pref in prefs:
            # check whether the number of candidates in the preference schedule
            # is valid
            if len(pref) != len(candidates):
                raise InputError('Invalid preference schedule')

            # check whether the candidates in the preference schedule are unique
            if len(pref) != len(candidates):
                raise InputError('Invalid preference schedule')

            # check whether the candidates in the preference schedule are also
            # in the candidates list
            for candidate in pref:
                if candidate not in candidates:
                    raise InputError('Invalid preference schedule')

        self.prefs = prefs

    def detailed(self):
        '''Returns the detailed preference schedule as a printable string'''

        # count the number of occurences of each preference
        prefs = self.prefs[:]
        prefs = [tuple(p) for p in self.prefs]
        counts = {}
        while prefs:
            pref = prefs.pop(0)
            count = 1
            while pref in prefs:
                prefs.remove(pref)
                count += 1
            counts[pref] = count

        res = ''
        for pref in counts:
            res += str(counts[pref]) + ' Voters: ' + ', '.join(pref) + '\n'

        return res[:-1]


class Aggregator():

    def __init__(self, file):
        try:
            candidates, prefs = csv_to_preference_schedule(file)
            self.candidates = candidates
            self.pref_schedule = PreferenceSchedule(candidates, prefs)
        except InputError as e:
            print('Error:', e.msg)
            sys.exit()

    def __str__(self):
        res = ''
        res += 'Detailed Preference Schedule:\n'
        res += self.pref_schedule.detailed() + '\n'

        return res

    def plurality(self):
        '''Prints who wins by the plurality method'''

        counts = {}
        for pref in self.pref_schedule.prefs:
            highest = pref[0]
            if highest in counts:
                counts[highest] += 1
            else:
                counts[highest] = 1

        winner = []
        highest_votes = max(counts.values())
        for candidate in counts:
            if counts[candidate] == highest_votes:
                winner.append(candidate)

        print('The numbers of votes for each candidate:', counts)
        print('The winner(s) is(are)', find_winner(counts))

    def runoff(self):
        '''Prints who wins by the runoff method'''

        # first round
        counts = {}
        for pref in self.pref_schedule.prefs:
            highest = pref[0]
            if highest in counts:
                counts[highest] += 1
            else:
                counts[highest] = 1

        first_round_winners = []
        scores = list(counts.values())
        highest_votes = max(scores)
        while highest_votes in scores:
            scores.remove(highest_votes)
        second_highest_votes = max(scores)
        for candidate in counts:
            if counts[candidate] == highest_votes:
                first_round_winners.append(candidate)
        if len(first_round_winners) == 1:
            for candidate in counts:
                if counts[candidate] == second_highest_votes:
                    first_round_winners.append(candidate)

        print('The numbers of votes for each candidate in the first round:', counts)
        print('The first round winners are', first_round_winners)

        # second round
        counts = {c: 0 for c in first_round_winners}
        for candidate in first_round_winners:
            for pref in self.pref_schedule.prefs:
                ranks = [pref.index(c) for c in first_round_winners]
                if pref.index(candidate) == min(ranks):
                    counts[candidate] += 1

        print('The numbers of votes for each candidate in the second round:', counts)
        print('The winner(s) is(are)', find_winner(counts))

    def elimination(self):
        '''Prints who wins by the elimination method'''

        num_round = 1
        candidates = self.candidates[:]
        prefs = copy.deepcopy(self.pref_schedule.prefs)

        while len(candidates) >= 2:
            counts = {}
            for pref in prefs:
                highest = pref[0]
                if highest in counts:
                    counts[highest] += 1
                else:
                    counts[highest] = 1
            print('The numbers of votes for each candidate (round {}):'.format(
                num_round), counts)

            lowest_votes = min(counts.values())
            for candidate in counts:
                if counts[candidate] == lowest_votes:
                    candidates.remove(candidate)
                    for pref in prefs:
                        pref.remove(candidate)

            num_round += 1

        print('The winner(s) is(are)', find_winner(counts))

    def borda(self):
        '''Prints who wins by the Borda count'''

        counts = {}
        candidates = list(self.pref_schedule.prefs[0])
        for candidate in candidates:
            counts[candidate] = 0

        max_point = len(candidates) - 1
        for pref in self.pref_schedule.prefs:
            for i in range(len(pref)):
                counts[pref[i]] += max_point - i

        print('Borda scores:', counts)
        print('The winner(s) is(are)', find_winner(counts))

    def condorcet_comparison(self):
        '''Prints who wins by the pairwise comparison method'''

        points = {candidate: 0 for candidate in self.candidates}
        candidates = list(self.candidates)
        for candidate in candidates[:]:
            candidates.remove(candidate)
            for rival in candidates:
                candidate_points = 0
                for pref in self.pref_schedule.prefs:
                    if pref.index(candidate) < pref.index(rival):
                        candidate_points += 1
                    else:
                        candidate_points -= 1
                if candidate_points > 0:
                    points[candidate] += 1
                elif candidate_points == 0:
                    pass
                else:
                    points[rival] += 1

        print('Pairwise comparison points:', points)
        print('The winner is:', find_winner(points))
        print('The loser is:', find_loser(points))


def find_winner(aggregated_result):
    max_point = 0
    for point in aggregated_result.values():
        if point > max_point:
            max_point = point

    winner = []
    for candidate in aggregated_result.keys():
        if aggregated_result[candidate] == max_point and max_point > len(aggregated_result.values()) - 2:
            winner.append(candidate)

    if set(aggregated_result.values()) == set([1]):
        return []
    else:
        return winner


def find_loser(aggregated_result):
    loser = []

    for candidate in aggregated_result.keys():
        if aggregated_result[candidate] == 0:
            loser.append(candidate)

    if len(loser) == 1:
        return loser
    else:
        return []


def csv_to_preference_schedule(file):
    '''Reads a csv file and returns candidates and preferences'''

    _, ext = os.path.splitext(file)
    if file not in os.listdir('.'):
        raise InputError('File does not exist')
    if ext != '.csv':
        raise InputError('File must be a csv file')

    with open(file) as f:
        candidates = None
        prefs = []
        reader = csv.reader(f)
        for row in reader:
            if candidates is None:
                candidates = list(row)
            else:
                prefs.append(list(row))

        return candidates, prefs


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'csv', help='a csv file containing preferences', type=str)
    parser.add_argument('-m', '--method', type=str,
                        help='specify a winner selection method by a name')
    args = parser.parse_args()

    aggr = Aggregator(args.csv)

    if args.method:
        method = args.method
        try:
            if method == 'borda':
                print('\nBorda count\n')
                print(aggr)
                aggr.borda()
            elif method == 'elimination':
                print('\nElimination method\n')
                print(aggr)
                aggr.elimination()
            elif method == 'condorcet':
                print('\nCondorcet comparison method\n')
                print(aggr)
                aggr.condorcet_comparison()
            elif method == 'plurality':
                print('\nPlurality method\n')
                print(aggr)
                aggr.plurality()
            elif method == 'runoff':
                print('\nRunoff method\n')
                print(aggr)
                aggr.runoff()
            else:
                raise InputError('Invalid method name')
        except InputError as e:
            print('Error:', e.msg)
            sys.exit()
    else:
        # examine all winner selection methods
        print(aggr)
        print('Plurality method:')
        aggr.plurality()
        print('\nRunoff method:')
        aggr.runoff()
        print('\nElimination method:')
        aggr.elimination()
        print('\nBorda count:')
        aggr.borda()
        print('\nCondorcet comparison method:')
        aggr.condorcet_comparison()
