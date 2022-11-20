class Item_category < ActiveHash::Base
  self.data = [
    { id: 1,  category: '---',     sales_status: '---',
       shipping_fee_status: '---', scheduled_delivery_id: '---'},
    { id: 2,  category: 'レディース',    sales_status: '新品・未使用',
       shipping_fee_status: '着払い(購入者負担)', scheduled_delivery_id: '1-2日で発送' },
    { id: 3,  category: 'メンズ',    sales_status: '未使用に近い',
       shipping_fee_status: '送料こみ(出品者負担)', scheduled_delivery_id: '2-3日で発送'},
    { id: 4,  category: 'ベビー・キッズ',    sales_status: '目立った傷や汚れなし',
       scheduled_delivery_id: '4-7日で発送'},
    { id: 5,  category: 'インテリア・住まい・小物',    sales_status: 'やや傷や汚れあり'},
    { id: 6,  category: '本・音楽・ゲーム',      sales_status: '傷や汚れあり'},
    { id: 7,  category: 'おもちゃ・ホビー・グッズ',sales_status: '全体的に状態が悪い'},
    { id: 8,  category: '家電・スマホ・カメラ',},
    { id: 9,  category: 'スポーツ・レジャー',  },
    { id: 10, category: 'ハンドメイド',  },
    { id: 11, category: 'その他',  }
  ]
end