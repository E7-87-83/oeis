#!/usr/bin/perl
use strict;
use warnings;
use v5.10;


my $UPPER = $ARGV[0] || 20;

sub toBase {
    my $n = $_[0];
    my $b = $_[1];
    my $_n = $n;
    my @r;
    while ($_n > 0) {
        my $L = $_n % $b;
        $L = $L < 2 ? $L : 'z';
        unshift @r, $L;
        last if $L eq 'z';
        $_n = int $_n/$b;
    }
    return join "", @r;
}

sub countA {
    my $n = $_[0];
    my $ans = 1;
    for my $r (3..$n) {
        $ans++ if toBase($n, $r) =~ m/^[01]+$/;
    }
    return $ans;
}


for my $n (2..$UPPER) {
    my $c = countA($n);
    printf "%3d %3d\n", $n, $c ;
}

# a(new peak = 8) > 20000

# a(new peak = n):
# 1  2  3  4  5  6  7  
# 2, 3, 4, 9,30,81, 4096 
# A059972:
# 2, 3, 4, 9, 30, 81, 4096, 531441, 16777216 
#Is every term except 30 a power of either 2 or 3? 

=pod
All such bases are divisors of n or n-1, 
since the lowest base-B digit of n is 0 iff B | n, 1 iff B | n-1. 
- Robert Israel, Jul 04 2018 

(PARI) a(n) = sum(b=2, n, #select(x->(x>1), digits(n, b)) == 0); \\ Michel Marcus, Jul 04 2018 
=cut

=pod
  2   1
  3   2
  4   3
  5   3
  6   3
  7   3
  8   3
  9   4
 10   4
 11   3
 12   4
 13   4
 14   3
 15   3
 16   4
 17   4
 18   3
 19   3
 20   4
 21   4
 22   3
 23   3
 24   3
 25   4
 26   4
 27   4
 28   4
 29   3
 30   5

1000   5
1001   4
1002   4
1003   4
1004   3
1005   3
1006   3
1007   3
1008   4
1009   4
1010   4
1011   5
1012   4
1013   3
1014   3
1015   3
1016   3
1017   3
1018   3
1019   3
1020   3
1021   3
1022   3
1023   3
1024   5
1025   5
1026   3
1027   3
1028   4
1029   4
1030   3
1031   3
1032   3
1033   3
1034   3
1035   3
1036   3
1037   3
1038   3
1039   3
1040   4
1041   4
1042   3
1043   3
1044   4
1045   4
1046   3
1047   3
1048   3
1049   3
1050   3
1051   3
1052   3
1053   4
1054   4
1055   3
1056   5
1057   5
1058   3
1059   3
1060   3
1061   3
1062   4
1063   4
1064   3
1065   4
1066   4
1067   3
1068   3
1069   3
1070   3
1071   3
1072   3
1073   3
1074   3
1075   3
1076   3
1077   3
1078   3
1079   3
1080   4
1081   4
1082   3
1083   4
1084   4
1085   3
1086   3
1087   3
1088   4
1089   6
1090   5
1091   3
1092   5
1093   5
1094   3
1095   3
1096   3
1097   3
1098   3
1099   3
1100   4
1101   4
1102   3
1103   3
1104   4
1105   4
1106   3
1107   3
1108   4
1109   4
1110   4
1111   4
1112   3
1113   3
1114   3
1115   3
1116   3
1117   3
1118   3
1119   3
1120   3
1121   3
1122   4
1123   4
1124   3
1125   3
1126   3
1127   3
1128   3
1129   3
1130   3
1131   3
1132   3
1133   3
1134   3
1135   3
1136   3
1137   3
1138   3
1139   3
1140   3
1141   3
1142   3
1143   3
1144   3
1145   3
1146   3
1147   3
1148   3
1149   3
1150   3
1151   3
1152   3
1153   3
1154   3
1155   3
1156   4
1157   4
1158   3
1159   3
1160   3
1161   3
1162   3
1163   3
1164   3
1165   3
1166   3
1167   3
1168   3
1169   3
1170   3
1171   3
1172   3
1173   3
1174   3
1175   3
1176   3
1177   3
1178   3
1179   3
1180   3
1181   3
1182   3
1183   3
1184   3
1185   3
1186   3
1187   3
1188   3
1189   3
1190   4
1191   4
1192   3
1193   3
1194   3
1195   3
1196   3
1197   3
1198   3
1199   3
1200   3

4913   4
4914   4
4915   3
4916   3
4917   3
4918   3
4919   3
4920   3
4921   3
4922   3
4923   3
4924   3
4925   3
4926   3
4927   3
4928   3
4929   3
4930   4
4931   4
4932   3
4933   3
4934   3
4935   3
4936   3
4937   3
4938   3
4939   3
4940   3
4941   3
4942   3
4943   3
4944   3
4945   3
4946   3
4947   3
4948   3
4949   3
4950   3
4951   3
4952   3
4953   3
4954   3
4955   3
4956   3
4957   3
4958   3
4959   3
4960   3
4961   3
4962   3
4963   3
4964   3
4965   3
4966   3
4967   3
4968   3
4969   3
4970   4
4971   4
4972   3
4973   3
4974   3
4975   3
4976   3
4977   3
4978   3
4979   3
4980   3
4981   3
4982   3
4983   3
4984   3
4985   3
4986   3
4987   3
4988   3
4989   3
4990   3
4991   3
4992   3
4993   3
4994   3
4995   3
4996   3
4997   3
4998   3
4999   3
5000   3