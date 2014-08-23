require "spec_helper"

describe ".convert_to_octal" do
  actual = Filepermission.convert_to_octal "-rwxrwxrwx"
  it "should be 777" do
    expect(actual).to eq(777)
  end
end

describe ".convert_to_octal" do
  actual = Filepermission.convert_to_octal "-rw-r--r--"
  it "should be 644" do
    expect(actual).to eq(644)
  end
end

describe ".convert_to_octal" do
  actual = Filepermission.convert_to_octal "----------"
  it "should be 000" do
    expect(actual).to eq(000)
  end
end

describe ".convert_to_octal" do
  it "should raise error" do
    expect do
      Filepermission.convert_to_octal("---------")
    end.to raise_error
  end
end

describe ".convert_to_symbol" do
  it "should return expected string" do
    actual = Filepermission.convert_to_symbol("777")
    expect(actual).to eq("rwxrwxrwx")

    actual = Filepermission.convert_to_symbol("755")
    expect(actual).to eq("rwxr-xr-x")

    actual = Filepermission.convert_to_symbol("644")
    expect(actual).to eq("rw-r--r--")

    actual = Filepermission.convert_to_symbol("600")
    expect(actual).to eq("rw-------")

    actual = Filepermission.convert_to_symbol("000")
    expect(actual).to eq("---------")
  end
end
