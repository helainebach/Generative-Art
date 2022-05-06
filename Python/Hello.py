import random
x = int(input('Enter a number: '))
# x = random.randint(1,100)
if x % 2 == 0:
    fruit = 'apple'
    w = 'even'
else:
    fruit = 'orange'
    w = 'odd'
# print('The number ' + x_str + ' is '+w+ ', so the fruit is an ' + fruit+'.')
# print(fruit.title()+' has '+str(len(fruit))+ ' letters.')
# print('{} has {} letters.'.format( fruit.title(), str(len(fruit))))
print('The number {} is {}, so the fruit is an {}.'.format(x, w, fruit))
print('{} has {} letters.'.format(fruit.title(), len(fruit)))