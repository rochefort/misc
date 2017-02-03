# # 5と10より大きい
# (NR == 5) || (NR > 10) {
#   print NR ":" $0
# }

# # item-2 or item-3
# $2 ~ /item-[23]/ {
#   print $0
# }

# {
#   printf("name:%-10s sales:%5d\n", $1, $3)
# }

# BEGIN {
#   sum = 0
# }
# {
#   # sum = sum + $3
#   sum += $3
# }
# END {
#   print sum
# }

# {
#   printf("%f, %d\n", rand(), int($3/3))
# }

# length($1) > 7 {
#   print $0
# }

# {
#   print substr($4, 6, 5)
# }

# {
#   print NR ":" $0
#   if (NR % 5 == 0) {
#     print "----"
#   } else {
#     print "--"
#   }
# }

# {
#   printf("%-12s %5d ", $1, $3)
#   for (i = 0; i < int($3/10); i++) {
#     printf("*")
#   }
#   printf("\n")
# }
# 
# {
#   printf("%-12s %5d ", $1, $3)
#   i = 0
#   while (i < int($3/10)) {
#     printf("*")
#     i++
#   }
#   printf("\n")
# }

# BEGIN {
#   # 1始まり
#   sales[1] = 200
#   sales[2] = 120
#   sales[3] = 50
#   print sales[3]
# 
#   color = "yellow red blud"
#   split(color, colors)
#   print colors[3]
# 
#   for (i in colors) {
#     print colors[i]
#   }
# }

# {
#   sales[$1] += $3
# }
# END {
#   for (name in sales) {
#     print name ":" sales[name]
#   }
# }

function getRate(n) {
  return int(n / 100) * 0.1
}

{
  printf("%-12s %5d rate:%0.1f\n", $1, $3, getRate($3))
}