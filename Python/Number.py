#  get length of month
mLength = 30

hourly 	= .51
daily 	= hourly*24
monthly = daily*int(mLength)
# results
# print('It will cost ${:.2f} to operate per day. In a month with {} days, it will cost ${:.2f} to operate.'.format(daily, mLength, monthly))
saved = 918
print('\nIt will cost ${:.2f} to operate one server per day.\n'.format(daily))
print('In a month with {} days, it will cost ${:.2f} to operate one server.\n'.format(mLength,monthly))
print('It will cost ${:.2f} to operate twenty servers per day.\n'.format(daily*20))
print('In a month with {} days, it will cost ${:.2f} to operate twenty servers.\n'.format(mLength,monthly*20))
print('With ${:.2f}, I can operate one server for {} days.'.format(saved,int(saved/daily)))


