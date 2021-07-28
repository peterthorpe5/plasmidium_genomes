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
import matplotlib
# this code appended to prevent this error:
# self.tk = _tkinter.create(screenName, baseName,
# className, interactive, wantobjects, useTk, sync, use)
# _tkinter.TclError: no display name and
# no $DISPLAY environment variable
# Force matplotlib to not use any Xwindows backend.
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import pylab
numpy.seterr(divide = 'ignore') 


def plot_seq_len_histograms(busco, KIR, outname, prime):
    """takes in a 2 lists of number and plots a histogram.
    Plots two histograms on a graph """
    # the histogram of the data
    fig = plt.figure(figsize=(10, 8), dpi=1200)
    ax1 = fig.add_subplot(1, 2, 1)  # 1x2 grid, position 1
    # graph1
    data = [numpy.log10(KIR), numpy.log10(busco)]
    rects1 = ax1.boxplot(data)
    ax1.set_xlabel('KIR and BUSCO')
    ax1.set_ylabel('LOG10 Distances in Nucleotides')
    ax1.grid(True)
    ax1.set_title("%s KIR and BUSCO %s_prime Genic Distances" % (outname, prime))
    fig.tight_layout()
    fig
    outname = "%s_%s_prime.pdf" % (outname, prime)
    outpng = os.path.join(outname)
    pylab.savefig(outpng)
    pylab.close()

##def plot_seq_len_histograms(busco, KIR, outname, prime):
##    """takes in a 2 lists of number and plots a histogram.
##    Plots two histograms on a graph """
##    # the histogram of the data
##    fig = plt.figure(figsize=(10, 8), dpi=1200)
##    ax1 = fig.add_subplot(1, 2, 1)  # 1x2 grid, position 1
##    ax2 = fig.add_subplot(1, 2, 2)  # 1x2 grid, position 2
##    # graph1
##    rects1 = ax1.boxplot(numpy.log10(KIR))
##    ax1.set_xlabel('KIR')
##    ax1.set_ylabel('Count')
##    ax1.grid(True)
##    ax1.set_title("%s KIR %s_prime Genic Distances" % (outname, prime))
##    # graph 2
##    rects2 = ax2.boxplot(numpy.log10(busco))
##    ax2.set_xlabel('BUSCO')
##    ax2.set_ylabel('LOG10 Length in Nucleotides')
##    ax2.grid(True)
##    ax2.set_title("%s BUSCO %s_Prime Genic Distances" % (outname, prime))
##    fig.tight_layout()
##    fig
##    outname = "%s_%s_prime.pdf" % (outname, prime)
##    outpng = os.path.join(outname)
##    pylab.savefig(outpng)
##    pylab.close()

def average_standard_dev(lengths):
    """function to return the avaerage and stadard deviation
    for a list of number.
    Uses Numpy to do the calculations.
    Take in a list of lens
    returns the mean and standard deviation of the list"""
    the_mean = numpy.mean(lengths)
    standard_dev = numpy.std(lengths)
    print("mean = ", the_mean, "Standar dev = ", standard_dev)


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
                         ttest,
                         "man-whitney", 
                         str(Man_u_value),
                         "pvalue", 
                         str(Man_p_value)])
    print(outdata)
    return outdata


def seq_getter(filename1):
    """opens up a text file with gene names and distances to the nearest gene at the 5 prime
    and three prime direction. When given a list of wanted the scrpit will pull out the info
    for these genes of intesrest"""
    #text file with genes and distances - three columns
    f= open(filename1, "r")
    #outfile
    #assign the file contents to the variable data
    data = f.readlines()
    #load the data
    data1 = [line.rstrip("\n").split("\t") for line in (data)
             if line.strip() != "" and not line.startswith("g")]
    #to convert data 1 into a list of tuples.
    # print(data1[:10])
    location_data = [(str(s[0]), str(s[1]), str(s[2]), str(s[3])) for s in (data1)]
    #genes of interest # sicavrI
    KIR = set("""PKA1H1_STAND_010007900
PKA1H1_STAND_010018600
PKA1H1_STAND_020007800
PKA1H1_STAND_020007900
PKA1H1_STAND_020016000
PKA1H1_STAND_020019900
PKA1H1_STAND_030017200
PKA1H1_STAND_030027000
PKA1H1_STAND_050006500
PKA1H1_STAND_050007900
PKA1H1_STAND_050016600
PKA1H1_STAND_060010000
PKA1H1_STAND_060018300
PKA1H1_STAND_060023900
PKA1H1_STAND_060028900
PKA1H1_STAND_070010700
PKA1H1_STAND_070030800
PKA1H1_STAND_070032700
PKA1H1_STAND_080009400
PKA1H1_STAND_080011600
PKA1H1_STAND_080020800
PKA1H1_STAND_080022600
PKA1H1_STAND_080029200
PKA1H1_STAND_080037200
PKA1H1_STAND_090012400
PKA1H1_STAND_100005500
PKA1H1_STAND_100007600
PKA1H1_STAND_100017200
PKA1H1_STAND_110030100
PKA1H1_STAND_110052800
PKA1H1_STAND_110055500
PKA1H1_STAND_120016400
PKA1H1_STAND_120017800
PKA1H1_STAND_120018900
PKA1H1_STAND_120059500
PKA1H1_STAND_120061700
PKA1H1_STAND_130015400
PKA1H1_STAND_130019800
PKA1H1_STAND_130019900
PKA1H1_STAND_130025300
PKA1H1_STAND_130032100
PKA1H1_STAND_130049000
PKA1H1_STAND_130061900
PKA1H1_STAND_140019700
PKA1H1_STAND_140023400
PKA1H1_STAND_140037200
PKA1H1_STAND_140049300
PKA1H1_STAND_140059600
PKA1H1_STAND_140064800
PKA1H1_STAND_140074700
PKA1H1_STAND_140074900
PKA1H1_STAND_140078200
PKA1H1_STAND_050008200
PKA1H1_STAND_090018900
PKA1H1_STAND_100026200
PKA1H1_STAND_110017400
PKA1H1_STAND_120048500
PKA1H1_STAND_130028600
PKCLINC047_000005800
PKCLINC047_000009400
PKCLINC047_020015100
PKCLINC047_050007700
PKCLINC047_060023500
PKCLINC047_060027900
PKCLINC047_070030900
PKCLINC047_080021600
PKCLINC047_080023400
PKCLINC047_080036200
PKCLINC047_090050000
PKCLINC047_100005200
PKCLINC047_100017400
PKCLINC047_110053200
PKCLINC047_110055900
PKCLINC047_120059900
PKCLINC047_130014500
PKCLINC047_130018900
PKCLINC047_130024400
PKCLINC047_130061400
PKCLINC047_140058700
PKCLINC047_140063700
PKCLINC047_030017400
PKCLINC047_080012000
PKCLINC047_100007800
PKCLINC047_120019200
PKCLINC047_130048600
PKCLINC047_140036800
PKCLINC048_000009500
PKCLINC048_000009700
PKCLINC048_020016100
PKCLINC048_060024700
PKCLINC048_060029300
PKCLINC048_080021500
PKCLINC048_080023300
PKCLINC048_080038200
PKCLINC048_080048400
PKCLINC048_090012400
PKCLINC048_100005300
PKCLINC048_100007900
PKCLINC048_110055500
PKCLINC048_130019300
PKCLINC048_130028000
PKCLINC048_130029000
PKCLINC048_130061300
PKCLINC048_140019800
PKCLINC048_140023500
PKCLINC048_140059800
PKCLINC048_140075100
PKCLINC048_010019800
PKCLINC048_030026000
PKCLINC048_050007600
PKCLINC048_050007900
PKCLINC048_080011700
PKCLINC048_130019200
PKCLINC048_130048500
PKCLINC048_140016600
PKCLINC048_140049300""".split())

    busco = set("""PKA1H1_STAND_070027800
PKA1H1_STAND_070027400
PKA1H1_STAND_100014900
PKA1H1_STAND_110007300
PKA1H1_STAND_070012900
PKA1H1_STAND_070016900
PKA1H1_STAND_130034600
PKA1H1_STAND_130011200
PKA1H1_STAND_120037800
PKA1H1_STAND_110045100
PKA1H1_STAND_130007800
PKA1H1_STAND_010020100
PKA1H1_STAND_080009900
PKA1H1_STAND_140060300
PKA1H1_STAND_100011300
PKA1H1_STAND_110006400
PKA1H1_STAND_110015300
PKA1H1_STAND_090028700
PKA1H1_STAND_090013100
PKA1H1_STAND_040007000
PKA1H1_STAND_140046100
PKA1H1_STAND_060023600
PKA1H1_STAND_110017800
PKA1H1_STAND_130060900
PKA1H1_STAND_140015400
PKA1H1_STAND_130012200
PKA1H1_STAND_030008500
PKA1H1_STAND_120019600
PKA1H1_STAND_120013400
PKA1H1_STAND_080016200
PKA1H1_STAND_130008600
PKA1H1_STAND_100010300
PKA1H1_STAND_130052200
PKA1H1_STAND_040011500
PKA1H1_STAND_110017000
PKA1H1_STAND_110024000
PKA1H1_STAND_110031500


PKA1H1_STAND_140006900
PKA1H1_STAND_140027800


PKA1H1_STAND_050018200

PKA1H1_STAND_080040600
PKA1H1_STAND_140051100
PKA1H1_STAND_030012200
PKA1H1_STAND_020011100
PKA1H1_STAND_060011300
PKA1H1_STAND_120065300
PKA1H1_STAND_100022000
PKA1H1_STAND_090038200

PKA1H1_STAND_080027100
PKA1H1_STAND_070026600


PKA1H1_STAND_140048700
PKA1H1_STAND_090028900
PKA1H1_STAND_100020700

PKA1H1_STAND_130048100
PKA1H1_STAND_030023400


PKA1H1_STAND_140007400



PKA1H1_STAND_090028000
PKA1H1_STAND_110007900
PKA1H1_STAND_070008200

PKA1H1_STAND_040019800
PKA1H1_STAND_020009300
PKA1H1_STAND_080039700

PKA1H1_STAND_010020200
PKA1H1_STAND_120014600
PKA1H1_STAND_060014500
PKA1H1_STAND_110045700
PKA1H1_STAND_140049100

PKA1H1_STAND_080017100
PKA1H1_STAND_130053900

PKA1H1_STAND_090042800
PKA1H1_STAND_080042100
PKA1H1_STAND_010022600
PKA1H1_STAND_080015200
PKA1H1_STAND_060007600
PKA1H1_STAND_090030800
PKA1H1_STAND_080011800
PKA1H1_STAND_090046500
PKA1H1_STAND_100033000
PKA1H1_STAND_120019200

PKA1H1_STAND_080045700
PKA1H1_STAND_140020700


PKA1H1_STAND_020012700
PKA1H1_STAND_140011400
PKA1H1_STAND_050016400
PKA1H1_STAND_100009300
PKA1H1_STAND_040007200
PKA1H1_STAND_120025400
PKA1H1_STAND_090044600
PKA1H1_STAND_030020400
PKA1H1_STAND_120064100
PKA1H1_STAND_110035900
PKA1H1_STAND_100032700

PKA1H1_STAND_090033600

PKA1H1_STAND_080013500
PKA1H1_STAND_080041500


PKA1H1_STAND_100016800
PKA1H1_STAND_140068300
PKA1H1_STAND_120032600
PKA1H1_STAND_020018200

PKA1H1_STAND_120048600
PKA1H1_STAND_010011400
PKA1H1_STAND_060006500

PKA1H1_STAND_140020600
PKA1H1_STAND_030013700
PKA1H1_STAND_010015900
PKA1H1_STAND_030026000

PKA1H1_STAND_100008100
PKA1H1_STAND_030019000
PKA1H1_STAND_090043100
PKA1H1_STAND_050009200
PKA1H1_STAND_110041000
PKA1H1_STAND_090047100
PKA1H1_STAND_100035000
PKA1H1_STAND_040029700
PKA1H1_STAND_040017700

PKA1H1_STAND_130056400

PKA1H1_STAND_030022900
PKA1H1_STAND_120067800



PKA1H1_STAND_070005600

PKA1H1_STAND_070013700
PKA1H1_STAND_130016400
PKA1H1_STAND_110022100
PKA1H1_STAND_090031800
PKA1H1_STAND_120055200
PKA1H1_STAND_120072400
PKA1H1_STAND_080007300

PKA1H1_STAND_100018500
PKA1H1_STAND_060007000
PKA1H1_STAND_080024800
PKA1H1_STAND_040019200





PKA1H1_STAND_060022300
PKA1H1_STAND_120021200
PKA1H1_STAND_110027300
PKA1H1_STAND_140029500
PKA1H1_STAND_130047700
PKA1H1_STAND_140009200
PKA1H1_STAND_030006700


PKA1H1_STAND_120039100
PKA1H1_STAND_080040000
PKA1H1_STAND_090039300
PKA1H1_STAND_040019700
PKA1H1_STAND_050016500
PKA1H1_STAND_120019000
PKA1H1_STAND_140066400
PKA1H1_STAND_130049300
PKA1H1_STAND_040027500
PKA1H1_STAND_140016100



PKA1H1_STAND_030016900

PKA1H1_STAND_120075000
PKA1H1_STAND_140063400
PKA1H1_STAND_030020000
PKA1H1_STAND_090030400
PKA1H1_STAND_090049200
PKA1H1_STAND_110049500
PKA1H1_STAND_110022700
PKA1H1_STAND_140023500




PKNH_0723100
PKNH_0722700
PKNH_1010100
PKNH_1102400
PKNH_0708100
PKNH_0712200

PKNH_1328900
PKNH_1015900



PKNH_1305900

PKNH_1232800
PKNH_1139500

PKNH_1302500
PKNH_0115000
PKNH_0804900
PKNH_1455000

PKNH_1006500


PKNH_1101500
PKNH_1110400
PKNH_0923200
PKNH_0907900
PKNH_0402200
PKNH_1441600
PKNH_0618400
PKNH_1113000
PKNH_1356000
PKNH_1411200
PKNH_1306700
PKNH_0303500
PKNH_1215200
PKNH_1208900
PKNH_0811500
PKNH_1303300
PKNH_1005500
PKNH_1347400

PKNH_0406700
PKNH_1112200
PKNH_1119200
PKNH_1126300


PKNH_1402800
PKNH_1423400


PKNH_0512800

PKNH_0834700
PKNH_1446100
PKNH_0307200
PKNH_0205800
PKNH_0606400
PKNH_1260800
PKNH_1016900
PKNH_0933000

PKNH_0821700
PKNH_0721900


PKNH_1443800
PKNH_0923400
PKNH_1015600

PKNH_1343300
PKNH_0318000


PKNH_1403300



PKNH_0922500
PKNH_1103000
PKNH_0703400

PKNH_0415000
PKNH_0204000
PKNH_0833800

PKNH_0115100
PKNH_1210100
PKNH_0609600
PKNH_1140100
PKNH_1444200

PKNH_0812400
PKNH_1349100

PKNH_0937600
PKNH_0836300
PKNH_0117400
PKNH_0810400
PKNH_0602800
PKNH_0925300
PKNH_0806900
PKNH_0941300
PKNH_1027800
PKNH_1214800

PKNH_0839800
PKNH_1416400


PKNH_0207400
PKNH_1407300
PKNH_0510900
PKNH_1004500
PKNH_0402400
PKNH_1220500
PKNH_0939400
PKNH_0315100
PKNH_1259500
PKNH_1130400
PKNH_1027500

PKNH_0928100

PKNH_0808700
PKNH_0835600


PKNH_1012000
PKNH_1462900
PKNH_1227600
PKNH_0212600

PKNH_1243700
PKNH_0106400
PKNH_0601600

PKNH_1416300
PKNH_0308500
PKNH_0110800
PKNH_0320600

PKNH_1003300
PKNH_0313800
PKNH_0937900
PKNH_0504300
PKNH_1135500
PKNH_0941900
PKNH_1029800
PKNH_0424500
PKNH_0412900

PKNH_1351400

PKNH_0317500
PKNH_1263200



PKNH_0700800

PKNH_0708900
PKNH_1311000
PKNH_1117300
PKNH_0926300
PKNH_1250700
PKNH_1267800
PKNH_0802300

PKNH_1013700
PKNH_0602100
PKNH_0819600
PKNH_0414400





PKNH_0617200
PKNH_1216800
PKNH_1122100
PKNH_1425100
PKNH_1342900
PKNH_1405100
PKNH_0301700


PKNH_1234100
PKNH_0834100
PKNH_0934100
PKNH_0414900
PKNH_0511000
PKNH_1214600
PKNH_1461000
PKNH_1344500
PKNH_0422400
PKNH_1411900
PKNH_0311600
PKNH_1270400
PKNH_1458100
PKNH_0314700
PKNH_0924900
PKNH_0943900
PKNH_1143500
PKNH_1117900
PKNH_1419200
PKCLINC047_070027700
PKCLINC047_070027300
PKCLINC047_100015100
PKCLINC047_110007300
PKCLINC047_070012900
PKCLINC047_070016900
PKCLINC047_130033500
PKCLINC047_100021600
PKCLINC047_130010600
PKCLINC047_120038000
PKCLINC047_110044900
PKCLINC047_130007200
PKCLINC047_010019700
PKCLINC047_080010200
PKCLINC047_140059400
PKCLINC047_100011500
PKCLINC047_110006400
PKCLINC047_110015400
PKCLINC047_090027400
PKCLINC047_090012100
PKCLINC047_040006400
PKCLINC047_140045700
PKCLINC047_060023200
PKCLINC047_110018200
PKCLINC047_130060300
PKCLINC047_140015500
PKCLINC047_130011300
PKCLINC047_030008800
PKCLINC047_120020000
PKCLINC047_120013800
PKCLINC047_080016800
PKCLINC047_130008000
PKCLINC047_100010500
PKCLINC047_130051800

PKCLINC047_040010900
PKCLINC047_110017200
PKCLINC047_110024300
PKCLINC047_110031200
PKCLINC047_140007100
PKCLINC047_140027500


PKCLINC047_050017000

PKCLINC047_080039300
PKCLINC047_140050200
PKCLINC047_030012500
PKCLINC047_020010200
PKCLINC047_060011200
PKCLINC047_120065700
PKCLINC047_100022600
PKCLINC047_090037600

PKCLINC047_080027000
PKCLINC047_070026500


PKCLINC047_140047900
PKCLINC047_090027600
PKCLINC047_100021300

PKCLINC047_130047700
PKCLINC047_030023500


PKCLINC047_140007600



PKCLINC047_090026700
PKCLINC047_110007900
PKCLINC047_070008200

PKCLINC047_040019400
PKCLINC047_020008400
PKCLINC047_080038400

PKCLINC047_010019800
PKCLINC047_120015000
PKCLINC047_060014600
PKCLINC047_110045400
PKCLINC047_140048300

PKCLINC047_080017700
PKCLINC047_130053500

PKCLINC047_090042200
PKCLINC047_080040800
PKCLINC047_010022100

PKCLINC047_060007600
PKCLINC047_090029600
PKCLINC047_080012200
PKCLINC047_090046100
PKCLINC047_100034000
PKCLINC047_120019600

PKCLINC047_080044800
PKCLINC047_140020600


PKCLINC047_020011900
PKCLINC047_140011600
PKCLINC047_050015100
PKCLINC047_100009500
PKCLINC047_040006600
PKCLINC047_120025800
PKCLINC047_090044000
PKCLINC047_030020600
PKCLINC047_120064500
PKCLINC047_110035400
PKCLINC047_110036000
PKCLINC047_100033700

PKCLINC047_090032500

PKCLINC047_080014000
PKCLINC047_080040200


PKCLINC047_100017000
PKCLINC047_140067200
PKCLINC047_120032800
PKCLINC047_020017400

PKCLINC047_120048800
PKCLINC047_010011100
PKCLINC047_060006400

PKCLINC047_140020500
PKCLINC047_030013900
PKCLINC047_010015600
PKCLINC047_030026100

PKCLINC047_100008300
PKCLINC047_030019200
PKCLINC047_090042500
PKCLINC047_050008700
PKCLINC047_110040600
PKCLINC047_090046700
PKCLINC047_100036000
PKCLINC047_040028800
PKCLINC047_040017300

PKCLINC047_130055800

PKCLINC047_030023000
PKCLINC047_120068100


PKCLINC047_130023100
PKCLINC047_070005600

PKCLINC047_070013700
PKCLINC047_130015500
PKCLINC047_110022400
PKCLINC047_090030700
PKCLINC047_120055500
PKCLINC047_120072700
PKCLINC047_080007600

PKCLINC047_100018700
PKCLINC047_060006900
PKCLINC047_080025100
PKCLINC047_040018800





PKCLINC047_060022000
PKCLINC047_120021600
PKCLINC047_110027200
PKCLINC047_140029200
PKCLINC047_130047300
PKCLINC047_140009400
PKCLINC047_030007000


PKCLINC047_120039300
PKCLINC047_080038700
PKCLINC047_090038700
PKCLINC047_040019300
PKCLINC047_050015200
PKCLINC047_120019400
PKCLINC047_140065300
PKCLINC047_130048900
PKCLINC047_040026700
PKCLINC047_140016200



PKCLINC047_030017000

PKCLINC047_120075300
PKCLINC047_140062500
PKCLINC047_030020200
PKCLINC047_090029200
PKCLINC047_090048700
PKCLINC047_110048900
PKCLINC047_110023000
PKCLINC047_140023300




PKCLINC048_070028100
PKCLINC048_070027700
PKCLINC048_100015300
PKCLINC048_110007400
PKCLINC048_070013200
PKCLINC048_070017200

PKCLINC048_130033700




PKCLINC048_130010600

PKCLINC048_120037800
PKCLINC048_110045400

PKCLINC048_130007200
PKCLINC048_010021200
PKCLINC048_080010000
PKCLINC048_140060200

PKCLINC048_100011700


PKCLINC048_110006500
PKCLINC048_110015700
PKCLINC048_090028500
PKCLINC048_090012700
PKCLINC048_040007000
PKCLINC048_140046500
PKCLINC048_060024400
PKCLINC048_110018300
PKCLINC048_130060300
PKCLINC048_140015700
PKCLINC048_130011300
PKCLINC048_030008800
PKCLINC048_120020000
PKCLINC048_120013900
PKCLINC048_080016700
PKCLINC048_130008000
PKCLINC048_100010600
PKCLINC048_130051700

PKCLINC048_040011500
PKCLINC048_110017500
PKCLINC048_110024500
PKCLINC048_110031700


PKCLINC048_140007200
PKCLINC048_140027800


PKCLINC048_050017300

PKCLINC048_080041400
PKCLINC048_140051000
PKCLINC048_030012500
PKCLINC048_020011000
PKCLINC048_060011700
PKCLINC048_120065800
PKCLINC048_100022500
PKCLINC048_090038500

PKCLINC048_080027300
PKCLINC048_070026900


PKCLINC048_140048700
PKCLINC048_090028700
PKCLINC048_100021200

PKCLINC048_130047600
PKCLINC048_030023000


PKCLINC048_140007700



PKCLINC048_090027800
PKCLINC048_110008000
PKCLINC048_070008200

PKCLINC048_040020100
PKCLINC048_020009200
PKCLINC048_080040500

PKCLINC048_010021300
PKCLINC048_120015100
PKCLINC048_060014900
PKCLINC048_110046000
PKCLINC048_140049100

PKCLINC048_080017600
PKCLINC048_130053400

PKCLINC048_090043100
PKCLINC048_080042900
PKCLINC048_010023700
PKCLINC048_080015600
PKCLINC048_060008100
PKCLINC048_090030700
PKCLINC048_080011900
PKCLINC048_090046900
PKCLINC048_100033700
PKCLINC048_120019600

PKCLINC048_080046600
PKCLINC048_140020800


PKCLINC048_020012700
PKCLINC048_140011800
PKCLINC048_050015400
PKCLINC048_100009600
PKCLINC048_040007200
PKCLINC048_120025400
PKCLINC048_090044900
PKCLINC048_030020000
PKCLINC048_120064600
PKCLINC048_110036000
PKCLINC048_110036600
PKCLINC048_100033400

PKCLINC048_090033500

PKCLINC048_080013900
PKCLINC048_080042300


PKCLINC048_100017200
PKCLINC048_140068500
PKCLINC048_120032600
PKCLINC048_020018300

PKCLINC048_120048700
PKCLINC048_010011500
PKCLINC048_060006900

PKCLINC048_140020700
PKCLINC048_030013800
PKCLINC048_010016000
PKCLINC048_030025700
PKCLINC048_100008400
PKCLINC048_030018300
PKCLINC048_090043400
PKCLINC048_050008900
PKCLINC048_110041200
PKCLINC048_090047500
PKCLINC048_100035700
PKCLINC048_040029900
PKCLINC048_040018000
PKCLINC048_130055700
PKCLINC048_030022500
PKCLINC048_120068200
PKCLINC048_130023400
PKCLINC048_070005600
PKCLINC048_070014000
PKCLINC048_130015500
PKCLINC048_110022600
PKCLINC048_090031700
PKCLINC048_120055800
PKCLINC048_120072800
PKCLINC048_080007400
PKCLINC048_100019000
PKCLINC048_060007400
PKCLINC048_080025200
PKCLINC048_040019500
PKCLINC048_060023100
PKCLINC048_120021600
PKCLINC048_110027700
PKCLINC048_140029500
PKCLINC048_130047200
PKCLINC048_140009500
PKCLINC048_030007000
PKCLINC048_120039100
PKCLINC048_080040800
PKCLINC048_090039600
PKCLINC048_040020000
PKCLINC048_050015500
PKCLINC048_120019400
PKCLINC048_140066600
PKCLINC048_130048800
PKCLINC048_040027700
PKCLINC048_140016400
PKCLINC048_030016200
PKCLINC048_120075400
PKCLINC048_140063300
PKCLINC048_030019600
PKCLINC048_090030300
PKCLINC048_090049500
PKCLINC048_110049600
PKCLINC048_110023200
PKCLINC048_140023600""".split())


  
    
    KIR_5prime = []
    busco_5prime = []
    KIR_3prime = []
    busco_3prime = []
    for i in location_data:
        gene_name = i[0]

        if gene_name in KIR:
            try:
                prime = int(i[1].rstrip())
                KIR_5prime.append(prime)
            except:
                pass
            try:
                prime = int(i[2].rstrip())
                KIR_3prime.append(prime)
            except:
                pass
        if gene_name  in busco:
            try:
                prime = int(i[1].rstrip())
                busco_5prime.append(prime)
            except:
                pass
            try:
                prime = int(i[2].rstrip())
                busco_3prime.append(prime)
            except:
                pass
    return KIR_5prime, KIR_3prime, busco_3prime, busco_5prime


####################
#
print("LOOKING AT: sks047 3 prime\n")
KIR_5prime, KIR_3prime, busco_3prime, busco_5prime = seq_getter('sk047_genic_distances.heatmap.txt')

plot_seq_len_histograms(busco_3prime, KIR_3prime, "sk047_", "3")

print("\nwe have %d BUSCO\n" % len(busco_3prime))
average_standard_dev(busco_3prime)
print("\nwe have %d 3 prime KIR\n" % len(KIR_3prime))
average_standard_dev(KIR_3prime)


outdata = stats_on_list_of_sizes(KIR_3prime, busco_3prime)

print("\nlooking at sks047: 5 prime")
print("we have %d 5 prime BUSCO\n" % len(busco_5prime))
average_standard_dev(busco_5prime)

print("we have %d 5 prime KIR\n" % len(KIR_5prime))
average_standard_dev(KIR_5prime)
plot_seq_len_histograms(busco_5prime, KIR_5prime, "sk047_", "5")



outdata = stats_on_list_of_sizes(KIR_5prime, busco_5prime)

############################################################
print("\nLOOKING AT: sk048: 3 prime\n")
KIR_5prime, KIR_3prime, busco_3prime, busco_5prime = seq_getter('sk048_genic_distances.heatmap.txt')
print("we have %d BUSCO\n" % len(busco_3prime))
average_standard_dev(busco_3prime)
plot_seq_len_histograms(busco_3prime, KIR_3prime, "sk048", "3")



print("we have %d 3 prime KIR\n" % len(KIR_3prime))
average_standard_dev(KIR_3prime)



outdata = stats_on_list_of_sizes(KIR_3prime, busco_3prime)

print("\nLOOKING AT:t sk048: 5 prime")
print("we have %d 5 prime BUSCO\n" % len(busco_5prime))
average_standard_dev(busco_5prime)

print("we have %d 5 prime KIR\n" % len(KIR_5prime))
average_standard_dev(KIR_5prime)
plot_seq_len_histograms(busco_5prime, KIR_5prime, "sk048", "5")




outdata = stats_on_list_of_sizes(KIR_5prime, busco_5prime)


############################################################
print("\n LOOKING AT: culture: 3 prime\n")
KIR_5prime, KIR_3prime, busco_3prime, busco_5prime = seq_getter('culture_genic_distances.heatmap.txt')
print("we have %d BUSCO\n" % len(busco_3prime))
average_standard_dev(busco_3prime)
plot_seq_len_histograms(busco_3prime, KIR_3prime, "culture", "3")



print("we have %d 3 prime KIR\n" % len(KIR_3prime))
average_standard_dev(KIR_3prime)



outdata = stats_on_list_of_sizes(KIR_3prime, busco_3prime)

print("\nLOOKING AT: culture: 5 prime")
print("we have %d 5 prime BUSCO\n" % len(busco_5prime))
average_standard_dev(busco_5prime)

print("we have %d 5 prime KIR\n" % len(KIR_5prime))
average_standard_dev(KIR_5prime)
plot_seq_len_histograms(busco_5prime, KIR_5prime, "culture", "5")




outdata = stats_on_list_of_sizes(KIR_5prime, busco_5prime)

#############

##############################################
print("looking at ref: 3 prime\n")


KIR_5prime, KIR_3prime, busco_3prime, busco_5prime = seq_getter('ref_genic_distances.heatmap.txt')
print("we have %d BUSCO\n" % len(busco_3prime))
average_standard_dev(busco_3prime)
print("we have %d 3 prime KIR\n" % len(KIR_3prime))
print("KIR_3prime", KIR_3prime)
average_standard_dev(KIR_3prime)
plot_seq_len_histograms(busco_3prime, KIR_3prime, "Reference", "3")



outdata = stats_on_list_of_sizes(KIR_3prime, busco_3prime)

###############################################
print("\nlooking at ref: 5 prime\n")

outdata = stats_on_list_of_sizes(KIR_5prime, busco_5prime)
print("we have %d 5 prime BUSCO\n" % len(busco_5prime))
average_standard_dev(busco_5prime)
print("we have %d 5 prime KIR\n" % len(KIR_5prime))
average_standard_dev(KIR_5prime)
plot_seq_len_histograms(busco_5prime, KIR_5prime, "Reference", "5")




