data = [
  [3.0, 1.5, 1],
  [2.0, 1.0, 0],
  [4.0, 1.5, 1],
  [3.0, 1.0, 0],
  [3.5, 0.5, 1],
  [2.0, 0.5, 0],
  [5.5, 1.0, 1],
  [1.0, 1.0, 0],
]

mystery_fower = [2.5, 12.5]

def sigmoid(x)
  1 / (1 + Math::E ** (-x))
end

def sigmoid_p(x)
  sigmoid(x) * (1 - sigmoid(x))
end

w1 = rand() * 2 - 1
w2 = rand() * 2 - 1
b = rand() * 2 - 1

learning_rate = 0.2

(1..5000).each do |i|
  ri = rand(data.length)
  point = data[ri]

  z = w1 * point[0] + w2 * point[1] + b
  pred = sigmoid(z)

  target = point[2]

  cost = (pred - target) ** 2

  dcost_pred = 2 * (pred - target)
  dpred_dz = sigmoid_p(z)

  dz_dw1 = point[0]
  dz_dw2 = point[1]
  dz_db = 1

  dcost_dw1 = dcost_pred * dpred_dz * dz_dw1
  dcost_dw2 = dcost_pred * dpred_dz * dz_dw2
  dcost_db = dcost_pred * dpred_dz * dz_db

  w1 = w1 - learning_rate * dcost_dw1
  w2 = w2 - learning_rate * dcost_dw2
  b = b - learning_rate * dcost_db

  if i % 100 == 0
    cost_sum = 0
    data.each do |point|
      z = w1 * point[0] + w2 * point[1] + b
      pred = sigmoid(z)
      target = point[2]
      cost_sum += (pred - target) ** 2
    end
    print "w1: #{w1} \t w2: #{w2} \t b: #{b} \t cost_sum: #{cost_sum}\n"
  end
end

final_pred = w1 * mystery_fower[0] + w2 * mystery_fower[1] + b
puts "========== final_pred: #{sigmoid(final_pred)}"
