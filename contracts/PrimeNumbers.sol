// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract PrimeNumbers {
    function _inc_one(uint256 i) internal pure returns (uint256) {
        unchecked {
            return i + 1;
        }
    }

    function _inc_x(uint256 j, uint256 x) internal pure returns (uint256) {
        unchecked {
            return j + x;
        }
    }

    function calculatePrimerNumbers(
        uint256 _limit
    ) public pure returns (uint256[] memory primes) {
        uint256 counter = 0;
        uint256[] memory list = new uint256[](_limit);
        primes = new uint256[](_limit / 2);

        for (uint256 i = 2; i < _limit; i = _inc_one(i)) {
            if (list[i] != 1) {
                primes[counter] = i;
                counter = _inc_one(counter);
                for (uint256 j = i * i; j < _limit; j = _inc_x(j, i)) {
                    list[j] = 1;
                }
            }
        }
    }
}
