class Activity < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '毎週1回' },
    { id: 3, name: '月1~2' },
    { id: 4, name: '３ヶ月に1~3' },
    { id: 5, name: 'その他' }
  ]
end
