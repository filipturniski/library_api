class BookFreeView < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE VIEW book_free_views AS
            select book_id, book_name, book_id, author_id, status_id from (
            select b.id as book_id, b.name as book_name, b.author_id as author_id, l.updated_at, l.status_id from books b
              left join loans l on b.id = l.book_id
              order by l.updated_at desc)
            group by book_id, book_name, book_id;
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP VIEW IF EXISTS book_free_views;
        SQL
      end
    end
  end
end
