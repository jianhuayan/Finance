#!/usr/bin/python2.7
import sys
import math

###################################################################################
# This is programe to compute how many books get be purchased on a on sales eventi#
#                                                                                 #
#              Created by Jianhua Yan for tokbox evaluation                       #
#                                                                                 #
###################################################################################                                  

# User input handling

budget = int(input("what is your budget? "))
print("OK, your total budget is " + str(budget) + "!")
if budget <= 0:
        print("Please input a positive dollar amount.no book can be bought.\n")

init_price = int(input("what is the initial price? "))
print("OK, Initlal price is " + str(init_price) + "!")
if init_price <= 0:
        print("Intial price must be a positive dollar amount.\n")

if budget < init_price:
        print("Budget is too low, No book can be bought, the remaining dollar is" ,budget)
        sys.exit()

disc_price = int(input("what is the discount price? "))
print("OK, Discount price is " + str(disc_price) + "!")
if disc_price <= 0:
        print("Discount price must be a positive dollar amount.\n")

floor_price = int(input("what is the floor price? "))
print("OK, Floor price is " + str(floor_price) + "!")
if floor_price <= 0:
        print("Floor price must be a positive dollar amount.\n")

# Calculate how many books can be bought before reach floor price

disc_num = (init_price - floor_price)/disc_price + ((init_price - floor_price)%disc_price > 0)
# print("total number of books can be purchased before reaching floor price is", disc_num)

# calculate sub total dollar amount before hitting the floor price
sub_total = ((init_price + init_price - (disc_num - 1) * disc_price) * disc_num)/2
# print("subtotal is %" , sub_total)

#calculate total number of books can be purchased if budget is more than sub_total

if budget >= sub_total:
        total_book = disc_num + (budget - sub_total)/floor_price
        print("Total number of books can be purchased is", total_book)
        remain_dollar = budget - sub_total - math.ceil((budget - sub_total)/floor_price)*floor_price
        print("Remaining dollar amount is", remain_dollar)

#calculate total number of books can be purchased if budget is less than sub_total
else:
        count = 1
        while ((budget - ((init_price + init_price - count * disc_price) * count)/2) > (init_price - count * disc_price)):
                count += 1
        print("total number of books is" ,count)
        remain_dollar2 = budget - ((init_price + init_price - (count - 1) * disc_price) * count )/2
        print("Remaining dollar amount is %",remain_dollar2)
