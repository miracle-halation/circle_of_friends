class Genre < ActiveHash::Base
	self.data = [
			{ id: 1, name: '--' },
			{ id: 2, name: 'スポーツ'}
			{ id: 3, name: 'グルメ'}
			{ id: 4, name: 'サブカルチャー'}
			{ id: 5, name: '旅'}
			{ id: 6, name: 'テレビ番組'}
			{ id: 7, name: '最新家電'}
			{ id: 8, name: 'その他'}
		]
end
