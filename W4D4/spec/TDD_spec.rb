require "TDD"

describe "#my_uniq" do 
  let(:array_1) {[1,2,3]}
  it "accepts an array" do 
    # expect { my_uniq(array_1 + 9) }.to raise_error(TypeError)
    my_uniq(array_1)
  end 

  it "does not use Array#uniq" do
    # my_uniq(array_1)
    expect(array_1).not_to receive(:uniq)
    my_uniq(array_1)
  end

  it "returns an array of unique elements" do 
    expect(my_uniq(array_1)).to eq([1, 2, 3])
  end 
  


end 

describe "#two_sum" do  
  let(:array_1) {[-1, 0, 2, -2, 1]}
  it "accepts an array" do 
    # expect { my_uniq(array_1 + 9) }.to raise_error(TypeError)
    two_sum(array_1)
  end 

  it "finds all pair indices where elements sum to 0" do 
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
  end 
end 


  describe "#my_transpose" do
    let(:array_1) {[[0, 1, 2],[3, 4, 5],[6, 7, 8]]}

    it "accepts a 2-D array" do 
      my_transpose(array_1)
    end

    it "converts between the row-oriented and column-oriented representations" do
      expect(my_transpose(array_1)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end

  end



  describe "#stock_picker" do 
    let(:array_1) {[300,300,200,260,350,320]}

    it "accepts an array" do 
      stock_picker(array_1)
    end

    it "returns pair of days at which max profits occurred " do
      expect(stock_picker(array_1)).to eq([2,4])
    end


  end
  
  
  describe Towers do
    # let(:tower) {Towers.new(5)}
    subject(:tower) {Towers.new(5)}

    describe '#initialize' do
      it "sets a number of discs" do
        expect(tower.num_discs).to eq(5)
      end
      
      it "takes a positive number for num_discs" do
        expect(tower.num_discs).to be >0
      end
    end

    # describe '#move' do
    #   arr1 = ['B']
    #   arr2 = ['A,D']
    #   arr3 = ['C']

    #   it "moves to correct stack" do
    #     expect(tower.move(arr1,arr2) )
    #   end

    #   it "prevents moving to wrong stack" do
    #   end
    # end
      


  end

