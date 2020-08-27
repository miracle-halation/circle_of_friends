class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アウトドア' },
    { id: 3, name: 'フード&ドリンク' },
    { id: 4, name: 'アニメ' },
    { id: 5, name: 'ゲーム' },
    { id: 6, name: '小説&漫画' },
    { id: 7, name: 'テクノロジー' },
    { id: 8, name: 'スポーツ&フィットネス' },
    { id: 9, name: '学び' },
    { id: 10, name: '健康＆福祉' },
    { id: 11, name: 'カメラ&動画' },
    { id: 12, name: '映画&ドラマ' },
    { id: 13, name: '絵を描く' },
    { id: 14, name: 'テーブルゲーム' },
    { id: 15, name: 'ペット' },
    { id: 16, name: 'ビジネス' },
    { id: 17, name: 'ダンス' },
    { id: 18, name: '音楽' },
    { id: 19, name: '外国語' },
    { id: 20, name: 'その他' }
  ]
end
