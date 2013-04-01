class User < ActiveRecord::Base
  attr_accessible :name

  class << self

    # 
    def single_insert(insert_count)
      insert_count.times do |c|
        User.create(:name => 'boo')
      end
    end

    def bulk_insert(bulk)
      User.import bulk
    end

    # 一度にbulkを受け取ってinsertする
    def each_bulk_insert(bulk, commit_count)
      bulk.in_groups_of(commit_count, false).each do |g|
        User.import g
      end
    end

    # commit_count分bulkを生成してinsertする
    def each_bulk_insert_by_commit(insert_count, commit_count)
      bulk = []

      insert_count.times.inject([]) do
        bulk << User.new(:name => 'boo')

        if bulk.size >= commit_count
          User.import bulk
          bulk = []
        end
      end

      User.import bulk
    end
  end
end

#count_all = 100000
#bulk = count_all.times.inject([]) { |memo| memo << User.new(:name => 'boo') }

#Benchmark.bm do |rep|
#  # 98 sec
#  rep.report("single"){ User.single_insert(count_all); User.delete_all }
#
#  # 27 sec
#  rep.report("bulk  "){ User.bulk_insert(bulk); User.delete_all }
#
#  # 27 sec
#  rep.report("bulk each"){ User.each_bulk_insert(bulk, 10000); User.delete_all }
#
#  # 29 sec
#  rep.report("bulk each by commit"){ User.each_bulk_insert_by_commit(count_all, 10000); User.delete_all }
#end
