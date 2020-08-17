class AgeRange < ActiveHash::Base
	self.data = [
		{ id: 1, name: '--' },
		{ id: 2, name: '20代が多い'},
		{ id: 3, name: '30代が多い'},
		{ id: 4, name: '40代が多い'},
		{ id: 5, name: '50代が多い'},
		{ id: 6, name: '60代が多い'}
	]
end
