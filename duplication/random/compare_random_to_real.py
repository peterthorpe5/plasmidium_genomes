import os
import gzip
import sys
import subprocess
import numpy
# for tests
# https://docs.scipy.org/doc/scipy/reference/
# tutorial/stats.html#t-test-and-ks-test
from scipy import stats
from scipy.stats import mannwhitneyu
from optparse import OptionParser


usage = """Use as follows:

$ python.py -i goi -r random

"""

###################################
parser = OptionParser(usage=usage)

parser.add_option("-i","--in", dest="infile",
                  default=None,
                  help="infile with the names of interest",
                  metavar="FILE")

parser.add_option("-r","--random", dest="random_infile",
                  default=None,
                  help="infile with the names of interest",
                  metavar="FILE")

parser.add_option("-o", "--out", dest="out", default="result.out",
                  help="output filenames")


(options, args) = parser.parse_args()

infile = options.infile
random_infile = options.random_infile
out = options.out

def stats_on_list_of_sizes(db_lens, assemb_lens):
    """function to perform stats on two lists of seq lens.
    Returns as a tab separeated string:
    as_skew,
    db_skew,
    ttest,
    Man_u_value,
    Man_p_value"""
    as_skew = ('normal skewtest assemb_lens = %6.3f pvalue = %6.4f' %
               stats.skewtest(assemb_lens))
    db_skew = ('normal skewtest db_lens = %6.3f pvalue = %6.4f' %
               stats.skewtest(db_lens))
    ttest = ('t-statistic = %6.3f pvalue = %6.4f' %
             stats.ttest_ind(db_lens, assemb_lens))
    Man_u_value, Man_p_value = mannwhitneyu(db_lens, assemb_lens,
                                            alternative="two-sided")
    outdata = "\t".join([as_skew,
                         db_skew,
                         "man-whitney", 
                         str(Man_u_value),
                         "pvalue", 
                         str(Man_p_value)])
    print(outdata)
    return outdata


def parse_infile(infile, randon="NO"):
    """ functio to parse the data. returns a list of ints"""
    # parse the data file
    out_list = []
    with open (infile,"r") as dip_file:
        for line in dip_file:
            line = test_line(line)
            if line: 
                if randon != "NO":
                    out_list.append(int(line))
                else:
                    gene, dup  = line.rstrip().split("\t")
                    out_list.append(int(dup))
    return out_list


def test_line(line):
    """returns true lines. Not comments or blank line"""
    if not line.strip():
        return False  # if the last line is blank
    if not line.split():
        return False  # if the last line is blank
    if line.startswith("#"):
        return False  # comment line
    return line.rstrip()



random_data = parse_infile(random_infile, "yes")
print("random loaded")
# print(random_data)
GOI_data = parse_infile(infile)
# print(GOI_data)

 #  man whitney sats on this. 
outdata = stats_on_list_of_sizes(GOI_data, random_data)
