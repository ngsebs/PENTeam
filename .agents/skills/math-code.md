# Mathematical Code Implementation Skill
# Best practices for translating mathematical concepts to code

## Code Organization

```
project/
├── __init__.py
├── theorems/
│   ├── __init__.py
│   ├── theorem_name.py
│   └── test_theorem_name.py
├── utils/
│   ├── __init__.py
│   └── numerical.py
└── docs/
    └── theorem_documentation.md
```

## Function Template

```python
def theorem_function(param1: Type1, param2: Type2) -> ReturnType:
    """
    Brief description of what this computes.

    Mathematical basis:
    - Theorem: [Theorem name and statement]
    - Method: [Brief explanation of approach]
    - Complexity: O([time]), O([space])

    Args:
        param1: Description and constraints (e.g., must be positive integer)
        param2: Description and constraints

    Returns:
        Description of output

    Raises:
        ValueError: When input is invalid
        ArithmeticError: When computation overflows

    Examples:
        >>> theorem_function(5)
        expected_result
        >>> theorem_function(0)
        Traceback (most recent call last):
            ...
        ValueError: param1 must be positive
    """
    # Validate inputs
    if param1 <= 0:
        raise ValueError("param1 must be positive")
    
    # Implementation
    pass
```

## Type Hints

Always use type hints for:
- Function parameters
- Return values
- Class attributes
- Complex data structures

```python
from typing import List, Tuple, Dict, Optional, Union
import numpy as np

def compute_series(n: int) -> List[float]:
    ...

def matrix_operation(m: np.ndarray) -> Tuple[np.ndarray, float]:
    ...

def validate_theorem(params: Dict[str, Union[int, float]]) -> Optional[bool]:
    ...
```

## Numerical Considerations

1. **Precision**
   - Use `decimal.Decimal` for financial calculations
   - Consider `fractions.Fraction` for exact rational results
   - Use `sympy` for symbolic computation

2. **Overflow/Underflow**
   - Check for `math.inf` and `math.nan`
   - Use logarithmic representations for very large/small numbers
   - Consider `numpy.finfo(float).max` limits

3. **Convergence**
   - Set maximum iterations
   - Check for numerical stability
   - Provide tolerance parameters

## Testing Requirements

Every implementation must have:

1. **Basic correctness tests**
2. **Edge case tests** (0, 1, -1, max, min)
3. **Property-based tests** (invariants, symmetries)
4. **Performance tests** (optional, with timeout)
5. **Reference comparison tests** (against known values)

## Documentation Requirements

- Docstring with mathematical basis
- Type hints on all functions
- Comments explaining mathematical reasoning
- Example usage in docstring
- References to source theorems