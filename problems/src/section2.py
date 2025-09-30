def find_median_sorted_arrays(nums1: list[int], nums2: list[int]) -> float:
    merged = nums1 + nums2
    merged.sort()
    
    total = len(merged)

    if total % 2 >= 1:
        return float(merged[total // 2])
    else:
        middle1 = merged[total // 2 + 1]
        middle2 = merged[total // 2]
        return (middle1 + middle2) / 2


# test case 1
nums1 = [1, 3]
nums2 = [2]
median = find_median_sorted_arrays(nums1, nums2)
print("1. median:", median)
assert median == 2.0, f"คำตอบที่คาดไว้คือ 2.0 แต่ได้ {median}"

# test case 2
nums1 = [1, 2]
nums2 = [3, 4]
median = find_median_sorted_arrays(nums1, nums2)
print("2. median:", median)
assert median == 2.5, f"คำตอบที่คาดไว้คือ 2.5 แต่ได้ {median}"

# test case 3
nums1 = [0, 0]
nums2 = [0, 0]
median = find_median_sorted_arrays(nums1, nums2)
print("3. median:", median)
assert median == 0.0, f"คำตอบที่คาดไว้คือ 0.0 แต่ได้ {median}"

# test case 4
nums1 = []
nums2 = [1]
median = find_median_sorted_arrays(nums1, nums2)
print("4. median:", median)
assert median == 1.0, f"คำตอบที่คาดไว้คือ 1.0 แต่ได้ {median}"
