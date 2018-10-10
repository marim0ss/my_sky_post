# CSVデータインポートの記述・これがないとエラーになるよ
require 'csv'

# 名前空間： 「importする」という概要をつける
namespace :import_csv do
  desc "Userのcsvデータをインポートするタスク"  #タスクの説明を書く


  task users: :environment do   # タスク名 userデータをインポートしたい

    #インポートするファイルのパスを取得する記述.このファイルからインポートする
    path = File.join Rails.root, "db/csv/csv_users.csv"

    # 取得したパスをターミナルに表示させてみる
    puts "取得したパス: #{path}"
  #---------------------------------------------------------
  #  実際のインポート処理
  #---------------------------------------------------------

    list = []    # インポートするデータを格納する配列を作る

  # CSVファイルからインポートするデータを取得し、配列listに格納
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          birth_date: row["birth_date"],
          age: row["age"],
          birthplace: row["birthplace"],
          gender: row["gender"],
          how_are_you: row["how_are_you"]
      }
    end

    puts "インポート処理を開始します"  # 確認用にターミナルに表示させる

    #---------------------------------------------------------
    # インポートできなかった時の例外処理
    #begin ~ endで囲んだ処理はどんな処理でも最低1回は実行するようになる
    #---------------------------------------------------------

    begin
      User.create!(list)
      puts "インポート完了しました!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      # 「rescue => e」  e:例外オブジェクトを格納する変数
      puts "インポート失敗です : UnknownAttributeError"
    end

  end
end
