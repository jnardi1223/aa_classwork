require 'SQLite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true 
        self.results_as_hash = true 
    end

end

class Model
    def self.find_by_id(id) # lookup an id in the table, and return an object representing that row

    end
    # Your initialize method should take an options hash of attributes and construct an 
    # object wrapping that data. We do this because the DB query return value is an array 
    # of hashes in exactly this format.
    def initialize
    end

end

class Users < Model
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE id = #{id}")
        data.map { |datum| Users.new(datum) }
    end

    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE fname = '#{fname}' AND lname = '#{lname}'") # maybe not use singlequote encapsulation (?)
        data.map { |datum| User.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def followed_questions
        QuestionFollows.followed_questions_for_user_id(@id)
    end

    def authored_questions
        Questions.find_by_author_id(@id)
    end

    def authors_replies
        Replies.find_by_user_id(@id)

    end 

    def create
        raise "#{self} already in database" if @id
        QuestionDatabase.instance.execute(<<-SQL, @fname, @lname)
            INSERT INTO
                users (fname, lname)
            VALUES
                (?, ?)
        SQL
        @id = QuestionDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionDatabase.instance.execute(<<-SQL, @fname, @lname)
            UPDATE
                users
            SET
                fname = ?, lname = ?
            WHERE
                id = ?
        SQL
    end

end

class Questions < Model
    # should return an instance of our Question class NOT the data hash returned by the QuestionsDatabase! 
    # Your ::find_by_id method should contain Question.new somewhere.
    def self.find_by_id(id) 
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE id = #{id}")
        data.map { |datum| Questions.new(datum) }
    end


    def self.find_by_author_id(id) 
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE user_id = #{id}")
        data.map { |datum| Questions.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def followers
        QuestionFollows.followers_for_question_id(@id)
    end

    def author
        Users.find_by_id(@user_id)
    end 

    def replies
        Replies.find_by_question_id(@id)
    end 

    def create
        raise "#{self} already in database" if @id
        QuestionDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
            INSERT INTO
                questions (title, body, user_id)
            VALUES
                (?, ?, ?)
        SQL
        @id = QuestionDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
            UPDATE
                questions
            SET
                title = ?, body = ?, user_id = ?
            WHERE
                id = ?
        SQL
    end

end

class Replies < Model
    
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE id = #{id}")
        data.map { |datum| Replies.new(datum) }
    end

    def self.find_by_user_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE user_id = #{id}")
        data.map { |datum| Replies.new(datum) }
    end

    def self.find_by_question_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE question_id = #{id}")
        data.map { |datum| Replies.new(datum) }
    end

    def self.find_by_parent_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE parent_reply_id = #{id}")
        data.map { |datum| Replies.new(datum) }
    end     

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @user_id = options['user_id']
        @body = options['body']
    end  

    def author
        User.find_by_id(@user_id)
    end

    def question
        Questions.find_by_id(@question_id)
    end 

    def parent_reply
        Replies.find_by_id(@parent_reply_id)
    end 

    def child_replies
        Replies.find_by_parent_id(@id)
    end 

    def create
        raise "#{self} already in database" if @id
        QuestionDatabase.instance.execute(<<-SQL, @question_id, @parent_reply_id, @user_id, @body)
            INSERT INTO
                questions (question_id, @parent_reply_id, @user_id, @body)
            VALUES
                (?, ?, ?, ?)
        SQL
        @id = QuestionDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionDatabase.instance.execute(<<-SQL, @question_id, @parent_reply_id, @user_id, @body)
            UPDATE
                questions
            SET
                question_id = ?, parent_reply_id = ?, user_id = ?, body = ?
            WHERE
                id = ?
        SQL
    end


end

class QuestionFollows < Model

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows WHERE id = #{id}")
        data.map { |datum| QuestionFollows.new(datum) }
    end

    def self.followers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute("
            SELECT users.id, users.fname, users.lname
            FROM users 
            JOIN question_follows ON question_follows.user_id = users.id
            JOIN questions ON questions.id = question_follows.question_id
            WHERE users.id = (
                SELECT user_id  
                FROM question_follows 
                WHERE question_id = #{question_id}
            )
            ")
        data.map { |datum| QuestionFollows.new(datum) }
    end

    def self.followed_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute("
            SELECT questions.id, questions.title, questions.body, questions.user_id
            FROM questions
            JOIN question_follows ON question_follows.question_id = questions.id
            JOIN users ON users.id = question_follows.user_id
            WHERE questions.id = ( 
                SELECT question_id 
                FROM question_follows 
                WHERE user_id = #{user_id} 
            )
            ")
        data.map { |datum| QuestionFollows.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end 

    def create
        raise "#{self} already in database" if @id
        QuestionDatabase.instance.execute(<<-SQL, @question_id, @user_id )
            INSERT INTO
                questions (question_id, @user_id )
            VALUES
                (?, ?)
        SQL
        @id = QuestionDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionDatabase.instance.execute(<<-SQL, @question_id, @user_id )
            UPDATE
                questions
            SET
                question_id = ?, user_id = ?
            WHERE
                id = ?
        SQL
    end

end

class QuestionLikes < Model

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes WHERE id = #{id}")
        data.map { |datum| QuestionLikes.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end 

    def create
        raise "#{self} already in database" if @id
        QuestionDatabase.instance.execute(<<-SQL, @question_id, @user_id )
            INSERT INTO
                questions (question_id, @user_id )
            VALUES
                (?, ?)
        SQL
        @id = QuestionDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionDatabase.instance.execute(<<-SQL, @question_id, @user_id )
            UPDATE
                questions
            SET
                question_id = ?, user_id = ?
            WHERE
                id = ?
        SQL
    end

end
