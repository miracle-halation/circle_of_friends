class Activity < ActiveHash::Base
	self.data = [
			{ id: 1, name: '--' },
			{ id: 2, name: '毎週'},
			{ id: 3, name: '月に一回'},
			{ id: 4, name: '月に二回'},
			{ id: 5, name: 'その他'}
		]
end
