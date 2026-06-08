# Mathematical Testing Skill
# Comprehensive testing strategies for mathematical implementations

## Test Categories

### 1. Correctness Tests
Verify output matches expected mathematical results.

```python
def test_theorem_basic():
    """Verify basic case matches known result."""
    result = theorem_function(input_value)
    expected = known_result
    assert result == expected, f"Expected {expected}, got {result}"

@pytest.mark.parametrize("input,expected", [
    (0, result_for_zero),
    (1, result_for_one),
    (2, result_for_two),
    (10, result_for_ten),
])
def test_theorem_parametrized(input, expected):
    """Test multiple known cases."""
    assert theorem_function(input) == expected
```

### 2. Edge Case Tests
Test boundary conditions and special values.

```python
class TestEdgeCases:
    """Edge case test suite."""
    
    def test_zero(self):
        """Verify behavior at zero."""
        result = theorem_function(0)
        assert result == expected_zero
    
    def test_negative(self):
        """Verify behavior with negative inputs."""
        with pytest.raises(ValueError):
            theorem_function(-1)
    
    def test_one(self):
        """Verify behavior at one."""
        assert theorem_function(1) == expected_one
    
    def test_large_input(self):
        """Test numerical stability with large inputs."""
        result = theorem_function(1e15)
        assert math.isfinite(result)
    
    def test_very_small(self):
        """Test behavior with very small inputs."""
        result = theorem_function(1e-15)
        assert math.isfinite(result)
    
    def test_special_values(self):
        """Test with special mathematical values."""
        import math
        assert theorem_function(math.pi) == expected_pi
        assert theorem_function(math.e) == expected_e
        assert math.isnan(theorem_function(math.nan))
        assert theorem_function(math.inf) == expected_inf
```

### 3. Property-Based Tests
Verify mathematical properties hold.

```python
class TestProperties:
    """Property-based test suite."""
    
    def test_symmetry(self):
        """Verify f(-x) = f(x) for even functions."""
        for x in test_values:
            assert theorem_function(-x) == theorem_function(x)
    
    def test_monotonicity(self):
        """Verify monotonicity where applicable."""
        for i in range(len(test_values) - 1):
            assert theorem_function(test_values[i]) <= theorem_function(test_values[i+1])
    
    def test_invariant(self):
        """Verify mathematical invariant holds."""
        for params in test_parameter_sets:
            assert invariant_holds(theorem_function, params)
    
    def test_identity(self):
        """Verify known mathematical identities."""
        x, y = random_test_values()
        lhs = theorem_function(x) + theorem_function(y)
        rhs = theorem_function(x + y)  # or other identity
        assert math.isclose(lhs, rhs, rel_tol=1e-10)
```

### 4. Numerical Tests
Test numerical stability and precision.

```python
class TestNumerical:
    """Numerical stability test suite."""
    
    def test_precision(self):
        """Test precision with high-precision inputs."""
        high_precision_result = theorem_function_exact(decimal_value)
        float_result = theorem_function(float(decimal_value))
        assert abs(high_precision_result - float_result) < tolerance
    
    def test_convergence(self):
        """Test convergence behavior."""
        sequence = [theorem_function(1/n) for n in range(1, 1000)]
        # Verify sequence converges to expected limit
        assert abs(limit - sequence[-1]) < convergence_tolerance
    
    def test_no_overflow(self):
        """Test no overflow occurs."""
        for large_value in [1e100, 1e200, 1e308]:
            result = theorem_function(large_value)
            assert math.isfinite(result) or result == math.inf
    
    def test_consistency_across_methods(self):
        """Compare with alternative implementations."""
        result1 = theorem_function(input)
        result2 = theorem_function_alternative(input)
        assert math.isclose(result1, result2, rel_tol=1e-10)
```

## Test Report Template

```markdown
## Test Report: [Implementation Name]

**Date**: [Current date]
**Tester**: [Role]
**Status**: [PASS | FAIL | PARTIAL]

### Test Summary
| Category | Tests | Passed | Failed |
|----------|-------|--------|--------|
| Correctness | N | N | N |
| Edge Cases | N | N | N |
| Numerical | N | N | N |
| Property | N | N | N |

### Failed Tests
#### Test: [Name]
```
[Error message or assertion failure]
```
**Expected**: [What should happen]
**Actual**: [What happened]
**Severity**: [Critical | Major | Minor]
**Suggestion**: [How to fix]
```

## Bug Report Template

```markdown
## Bug Report #[Number]

**Severity**: [Critical | Major | Minor]
**Location**: [File and function]
**Test Case**: [Reproducer]

### Description
[What went wrong]

### Expected Behavior
[What should happen]

### Actual Behavior
[What happened]

### Steps to Reproduce
1. [Step 1]
2. [Step 2]

### Suggested Fix
[How to resolve]
```

## Testing Tools

- `pytest` - Test framework
- `pytest.mark.parametrize` - Parametrized tests
- `pytest.mark.xfail` - Expected failures
- `hypothesis` - Property-based testing
- `math.isclose` - Float comparison
- `decimal` - High precision testing
- `numpy.testing` - Array comparisons