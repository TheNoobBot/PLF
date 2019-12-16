
#   has_even(l1,l2,l3...ln, index) { 0 if empty
#                           { ! index%2 if l2...ln is empty
#                           { has_even(l1,l2,l3...ln, index + 1) otherwise
#
# B
#   drop_e(l1,l2,l3...ln, e)    {  [] if empty
#                               {  drop_e(l2,l3...ln, e) if l1 == e
#                               {  l1 + drop_e(l2,l3...ln) otherwise
#
#


def isEmpty(my_list):
    return len(my_list) == 0


def has_even(my_list, index):
    if isEmpty(my_list):
        return 0
    elif isEmpty(my_list[1:]):
        return not index % 2
    else:
        return has_even(my_list[1:], index + 1)


def drop_e(my_list, e):
    if isEmpty(my_list):
        return []
    elif my_list[0] == e:
        return drop_e(my_list[1:], e)
    else:

        return [my_list[0]] + drop_e(my_list[1:], e)

list1 = [0,2,4,6,8,10,12,14,16,18]
list2 = [1,3,5,7,9,11,13,15,17]
list3 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]

print("\n\nPROB 4\n")
print("Lists:\n list1: {} \n list2: {}\n list3: {}".format(list1,list2,list3))
print("A: Determine if has even numbers\n list1: {} \n list2: {}\n list3: {}".format(has_even(list1, 1),has_even(list2, 1),has_even(list3, 1)))
print("B: Delete all occurrences of e(5 passed as example)\n list1: {} \n list2: {}\n list3: {}".format(drop_e(list1, 5),drop_e(list2, 5),drop_e(list3, 5)))
