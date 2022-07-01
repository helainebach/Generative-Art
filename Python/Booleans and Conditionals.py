dist = input('How far would you like to travel in miles? ')
dist = int(dist)
if dist < 3:
	method = 'walking'
elif dist < 300:
	method = 'driving'
else:
	method = 'flying'
print('I suggest {} to your destination.'.format(method))