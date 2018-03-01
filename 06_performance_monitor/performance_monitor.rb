require "time"

def elapsed_time
  measure
end

def measure(n = 0)
  t1 = Time.now
  if n == 0
    yield
  else
    (1..n).each { |cur_time| res = yield(cur_time) }
  end
  (Time.now - t1) / (n == 0 ? 1 : n)
end

