// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// File: @openzeppelin/contracts/utils/math/SafeMath.sol

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

// File: @openzeppelin/contracts/utils/introspection/IERC165.sol


// OpenZeppelin Contracts v4.4.1 (utils/introspection/IERC165.sol)

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// File: @openzeppelin/contracts/token/ERC721/IERC721.sol


// OpenZeppelin Contracts v4.4.1 (token/ERC721/IERC721.sol)


/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

// File: @openzeppelin/contracts/utils/Context.sol


// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC20/IERC20.sol)

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol


// OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/IERC20Metadata.sol)


/**
 * @dev Interface for the optional metadata functions from the ERC20 standard.
 *
 * _Available since v4.1._
 */
interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}

// File: @openzeppelin/contracts/token/ERC20/ERC20.sol


// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC20/ERC20.sol)


/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin Contracts guidelines: functions revert
 * instead returning `false` on failure. This behavior is nonetheless
 * conventional and does not conflict with the expectations of ERC20
 * applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The default value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * NOTE: If `amount` is the maximum `uint256`, the allowance is not updated on
     * `transferFrom`. This is semantically equivalent to an infinite approval.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * NOTE: Does not update the allowance if the current allowance
     * is the maximum `uint256`.
     *
     * Requirements:
     *
     * - `from` and `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     * - the caller must have allowance for ``from``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, _allowances[owner][spender] + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = _allowances[owner][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    /**
     * @dev Moves `amount` of tokens from `sender` to `recipient`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     */
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(from, to, amount);

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
        }
        _balances[to] += amount;

        emit Transfer(from, to, amount);

        _afterTokenTransfer(from, to, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
        }
        _totalSupply -= amount;

        emit Transfer(account, address(0), amount);

        _afterTokenTransfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Spend `amount` form the allowance of `owner` toward `spender`.
     *
     * Does not update the allowance amount in case of infinite allowance.
     * Revert if not enough allowance is available.
     *
     * Might emit an {Approval} event.
     */
    function _spendAllowance(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * has been transferred to `to`.
     * - when `from` is zero, `amount` tokens have been minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens have been burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}


/**
 * @title StakeToken
 * @notice Represents a contract where a token owner has put her tokens up for others to stake and earn said tokens.
 */
contract StakeNFT is ERC20 {
  using SafeMath for uint256;
  bool public contractIsRemoved = false;
  bool public isEthReward = false;

  IERC20 private _rewardsToken;
  IERC721 private _stakedERC721;
  PoolInfo public pool;
  address private constant _burner = 0x000000000000000000000000000000000000dEaD;
  address private admin;

  struct PoolInfo {
    address creator; // address of contract creator
    address tokenOwner; // address of original rewards token owner
    uint256 origTotSupply; // supply of rewards tokens put up to be rewarded by original owner
    uint256 curRewardsSupply; // current supply of rewards
    uint256 totalTokensStaked; // current amount of tokens staked
    uint256 creationBlock; // block this contract was created
    uint256 rewardPercent; // percent of reward per period
    uint256 period; //period(uint seconds)
    uint256 lastRewardBlock; // Last block number that ERC20s distribution occurs.
    uint256 accERC20PerShare; // Accumulated ERC20s per share, times 1e36.
    uint256 stakeTimeLockSec; // number of seconds after depositing the user is required to stake before unstaking
  }

  struct StakerInfo {
    uint256 blockOriginallyStaked; // block the user originally staked
    uint256 timeOriginallyStaked; // unix timestamp in seconds that the user originally staked
    uint256 blockLastHarvested; // the block the user last claimed/harvested rewards
    uint256 rewardDebt; // Reward debt. See explanation below.
    uint256[] nftTokenIds; // if this is an NFT staking pool, make sure we store the token IDs here
  }

  struct RewardUpdateInfo {
    uint256[] rewardUpdatedTime;
    uint256[] rewardUpdatedAmount;
  }

  //number of stakers
  uint256 public totalStakers;
  //status of reward token amount
  RewardUpdateInfo private rewardStatus;
  // mapping of userAddresses => tokenAddresses that can
  // can be evaluated to determine for a particular user which tokens
  // they are staking.
  mapping(address => StakerInfo) public stakers;
  
  // mapping of userAddresses => total reward paid amount
  mapping(address => uint256) public totalRewardPaid;

  event Deposit(address indexed user, uint256 amount);
  event Withdraw(address indexed user, uint256 amount);

  /**
   * @notice The constructor for the Staking Token.
   * @param _rewardSupply The amount of tokens to mint on construction, this should be the same as the tokens provided by the creating user.
   * @param _rewardsTokenAddy Contract address of token to be rewarded to users
   * @param _stakedTokenAddy Contract address of token to be staked by users
   * @param _originalTokenOwner Address of user putting up staking tokens to be staked
   * @param _rewardPercent Percent of reward token amount per period
   * @param _period Period of reward(uint: seconds)
   * @param _stakeTimeLockSec number of seconds a user is required to stake, or 0 if none
   */
  constructor(
    uint256 _rewardSupply,
    address _rewardsTokenAddy,
    address _stakedTokenAddy,
    address _originalTokenOwner,
    uint256 _rewardPercent,
    uint256 _period,
    uint256 _stakeTimeLockSec
  ) ERC20("stakingNFTToken", "SNT") {
    require(_period > 3600*24, 'period must be longer than 1 day');
    _rewardsToken = IERC20(_rewardsTokenAddy);
    _stakedERC721 = IERC721(_stakedTokenAddy);

    pool = PoolInfo({
      creator: msg.sender,
      tokenOwner: _originalTokenOwner,
      origTotSupply: _rewardSupply,
      curRewardsSupply: _rewardSupply,
      totalTokensStaked: 0,
      creationBlock: 0,
      rewardPercent: _rewardPercent,
      period: _period,
      lastRewardBlock: block.number,
      accERC20PerShare: 0,
      stakeTimeLockSec: _stakeTimeLockSec
    });

    rewardStatus.rewardUpdatedTime.push(block.number + _stakeTimeLockSec);
    rewardStatus.rewardUpdatedAmount.push(_rewardSupply);

    if(_rewardsTokenAddy == 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE)
      isEthReward = true;
  }

  modifier onlyAdmin() {
    require(msg.sender == admin, "only possible for admin");
    _;
  }

  receive() external payable {}

  // SHOULD ONLY BE CALLED AT CONTRACT CREATION and allows changing
  // the initial supply if tokenomics of token transfer causes
  // the original staking contract supply to be less than the original
  function updateSupply(uint256 _newSupply) external {
    require(
      msg.sender == pool.creator,
      'only contract creator can update the supply'
    );
    pool.origTotSupply = _newSupply;
    pool.curRewardsSupply = _newSupply;
  }

  function stakedTokenAddress() external view returns (address) {
    return address(_stakedERC721);
  }

  function rewardsTokenAddress() external view returns (address) {
    if(isEthReward)
      return 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    else
      return address(_rewardsToken);
  }

  function tokenOwner() external view returns (address) {
    return pool.tokenOwner;
  }

  function getStakedTokenIds(address userAddress) external view returns(uint256[] memory) {
    uint len =  stakers[userAddress].nftTokenIds.length;

    uint256[] memory ret = new uint256[](len);
    for (uint i = 0; i < len; i++) {
        ret[i] = stakers[userAddress].nftTokenIds[i];
    }
    return ret;
  }

  function removeStakeableTokens() external {
    require(
      msg.sender == pool.creator || msg.sender == pool.tokenOwner,
      'caller must be the contract creator or owner to remove stakable tokens'
    );

    if(isEthReward)
      payable(pool.tokenOwner).transfer(pool.curRewardsSupply);
    else
      _rewardsToken.transfer(pool.tokenOwner, pool.curRewardsSupply);

    pool.curRewardsSupply = 0;
    contractIsRemoved = true;
  }

  function stakeTokens(uint256[] memory _tokenIds) public {
    _updatePool();

    if (balanceOf(msg.sender) > 0) {
      _harvestTokens(msg.sender);
    }

    uint256 _finalAmountTransferred;
    require(
        _tokenIds.length > 0,
        "you need to provide NFT token IDs you're staking"
    );

    for (uint256 _i = 0; _i < _tokenIds.length; _i++) {
        _stakedERC721.transferFrom(msg.sender, address(this), _tokenIds[_i]);
    }

    _finalAmountTransferred = _tokenIds.length;

    if (totalSupply() == 0) {
      pool.creationBlock = block.number;
      pool.lastRewardBlock = block.number;
    }

    if(balanceOf(msg.sender) == 0) {
      totalStakers++;
    }

    _mint(msg.sender, _finalAmountTransferred);
    StakerInfo storage _staker = stakers[msg.sender];
    _staker.blockOriginallyStaked = block.number;
    _staker.timeOriginallyStaked = block.timestamp;
    _staker.blockLastHarvested = block.number;
    _staker.rewardDebt = balanceOf(msg.sender).mul(pool.accERC20PerShare).div(
      1e36
    );
    for (uint256 _i = 0; _i < _tokenIds.length; _i++) {
      _staker.nftTokenIds.push(_tokenIds[_i]);
    }
    _updNumStaked(_finalAmountTransferred, 'add');
    emit Deposit(msg.sender, _finalAmountTransferred);
  }

  // pass 'false' for _shouldHarvest for emergency unstaking without claiming rewards
  function unstakeTokens(bool _shouldHarvest) external {
    StakerInfo memory _staker = stakers[msg.sender];
    uint256 _userBalance = balanceOf(msg.sender);

    // allow unstaking if the user is emergency unstaking and not getting rewards or
    // if theres a time lock that it's past the time lock or
    // the contract rewards were removed by the original contract creator or
    // the contract is expired
    require(
      !_shouldHarvest ||
        block.timestamp >=
        _staker.timeOriginallyStaked.add(pool.stakeTimeLockSec) ||
        contractIsRemoved,
      'you have not staked for minimum time lock yet'
    );

    _updatePool();

    if (_shouldHarvest) {
      _harvestTokens(msg.sender);
    }

    uint256 _amountToRemoveFromStaked = _userBalance;

    transfer(_burner, _amountToRemoveFromStaked);

    for (uint256 _i = 0; _i < _staker.nftTokenIds.length; _i++) {
        _stakedERC721.transferFrom(
            address(this),
            msg.sender,
            _staker.nftTokenIds[_i]
        );
    }

    if (balanceOf(msg.sender) <= 0) {
      delete stakers[msg.sender];
      if (totalStakers > 0) {
        totalStakers--;
      }
    }

    _updNumStaked(_amountToRemoveFromStaked, 'remove');
    emit Withdraw(msg.sender, _amountToRemoveFromStaked);
  }

  function emergencyUnstake() external {
    StakerInfo memory _staker = stakers[msg.sender];
    uint256 _amountToRemoveFromStaked = balanceOf(msg.sender);
    require(
      _amountToRemoveFromStaked > 0,
      'user can only unstake if they have tokens in the pool'
    );

    transfer(_burner, _amountToRemoveFromStaked);

    for (uint256 _i = 0; _i < _staker.nftTokenIds.length; _i++) {
        _stakedERC721.transferFrom(
            address(this),
            msg.sender,
            _staker.nftTokenIds[_i]
        );
    }
    
    delete stakers[msg.sender];

    if (totalStakers > 0) {
      totalStakers--;
    }

    _updNumStaked(_amountToRemoveFromStaked, 'remove');
    emit Withdraw(msg.sender, _amountToRemoveFromStaked);
  }

  function harvestForUser(address _userAddy)
    external
    returns (uint256)
  {
    require(
      msg.sender == pool.creator || msg.sender == _userAddy,
      'can only harvest tokens for someone else if this was the contract creator'
    );
    _updatePool();
    uint256 _tokensToUser = _harvestTokens(_userAddy);

    return _tokensToUser;
  }

  function getTotalRewardPaid(address _userAddy) external view returns (uint256) {
    return totalRewardPaid[_userAddy];
  }

  function getTotalStakers() external view returns (uint256) {
    return totalStakers;
  }

  function calcHarvestTot(address _userAddy) public view returns (uint256) {
    StakerInfo memory _staker = stakers[_userAddy];

    if (
      _staker.blockLastHarvested >= block.number ||
      _staker.blockOriginallyStaked == 0 ||
      pool.totalTokensStaked == 0
    ) {
      return uint256(0);
    }

    uint256 _accERC20PerShare = pool.accERC20PerShare;

    if (block.number > pool.lastRewardBlock && pool.totalTokensStaked != 0) {
      uint256 _erc20Reward = _calcRewardAmountTot(block.number).sub(_calcRewardAmountTot(pool.lastRewardBlock));
      _accERC20PerShare = _accERC20PerShare.add(
        _erc20Reward.mul(1e36).div(pool.totalTokensStaked)
      );
    }

    uint256 _harvestaccum = balanceOf(_userAddy).mul(_accERC20PerShare).div(1e36);

    if(_harvestaccum > _staker.rewardDebt)
      return _harvestaccum.sub(_staker.rewardDebt);
    else
      return 0;
  }

  // Update reward variables of the given pool to be up-to-date.
  function _updatePool() private {
    uint256 _lastBlock = block.number;

    if (_lastBlock <= pool.lastRewardBlock) {
      return;
    }
    uint256 _stakedSupply = pool.totalTokensStaked;
    if (_stakedSupply == 0) {
      pool.lastRewardBlock = _lastBlock;
      return;
    }

    uint256 _erc20Reward = _calcRewardAmountTot(_lastBlock).sub(_calcRewardAmountTot(pool.lastRewardBlock));

    pool.accERC20PerShare = pool.accERC20PerShare.add(
      _erc20Reward.mul(1e36).div(_stakedSupply)
    );
    pool.lastRewardBlock = _lastBlock;
  }

  function _harvestTokens(address _userAddy) private returns (uint256) {
    StakerInfo storage _staker = stakers[_userAddy];
    require(_staker.blockOriginallyStaked > 0, 'user must have tokens staked');

    uint256 _num2Trans = calcHarvestTot(_userAddy);
    if (_num2Trans > 0) {
      if(isEthReward)
        payable(_userAddy).transfer(_num2Trans);
      else
        require(
          _rewardsToken.transfer(_userAddy, _num2Trans),
          'unable to send user their harvested tokens'
        );
      pool.curRewardsSupply = pool.curRewardsSupply.sub(_num2Trans);
    }
    _staker.rewardDebt = balanceOf(_userAddy).mul(pool.accERC20PerShare).div(
      1e36
    );
    _staker.blockLastHarvested = block.number;

    totalRewardPaid[_userAddy] = totalRewardPaid[_userAddy].add(_num2Trans);

    return _num2Trans;
  }

  //push history of received reward token from royalty
  function updateRewardSupply(uint256 _supplyAmount) external onlyAdmin {
    uint len = rewardStatus.rewardUpdatedTime.length;
    require(block.number - rewardStatus.rewardUpdatedTime[len - 1] > pool.period - 3600*24, 'can update your reward supply one day before the end period.');
    rewardStatus.rewardUpdatedTime.push(block.number);
    rewardStatus.rewardUpdatedAmount.push(_supplyAmount);
    pool.curRewardsSupply = pool.curRewardsSupply.add(_supplyAmount);
  }

  // update the amount currently staked after a user harvests
  function _updNumStaked(uint256 _amount, string memory _operation) private {
    if (_compareStr(_operation, 'remove')) {
      pool.totalTokensStaked = pool.totalTokensStaked.sub(_amount);
    } else {
      pool.totalTokensStaked = pool.totalTokensStaked.add(_amount);
    }
  }

  function _compareStr(string memory a, string memory b)
    private
    pure
    returns (bool)
  {
    return (keccak256(abi.encodePacked((a))) ==
      keccak256(abi.encodePacked((b))));
  }

  function _calcRewardAmountTot(uint256 _rewardAt) public view returns (uint256) {
    require(_rewardAt > rewardStatus.rewardUpdatedTime[0], 'can only calc after lock period');
    uint index = 0;
    for (uint i=0; i<rewardStatus.rewardUpdatedTime.length; i++) {
      if (rewardStatus.rewardUpdatedTime[i] > _rewardAt) {
        index = i - 1;
        break;
      }
    }

    uint256 totalRewardAmount = 0;
    for(uint i=0; i <= index; i++) {
      totalRewardAmount = totalRewardAmount.add(_calcRewardAmountPerStatus(i, _rewardAt));
    }
    return totalRewardAmount;
  }

  function _calcRewardAmountPerStatus(uint _index, uint256 _rewardAt) public view returns (uint256) {
    uint256 amount = 0;
    uint256 totalAmount = 0;
    uint256 _basePeriod = _rewardAt.sub(rewardStatus.rewardUpdatedTime[0]).div(pool.period).mul(pool.period);

    if(_index == 0) {
      uint256 count = _rewardAt.sub(rewardStatus.rewardUpdatedTime[0]).div(pool.period);
      amount = rewardStatus.rewardUpdatedAmount[0];
      for(uint256 i=0; i< count; i++) {
        amount = amount.mul(pool.rewardPercent).div(100);
        totalAmount = totalAmount.add(amount);
      }
      amount = amount.mul(pool.rewardPercent).div(100).mul(_rewardAt.sub(_basePeriod)).div(pool.period);
      totalAmount = totalAmount.add(amount);
    } else {
      uint256 count = (_rewardAt - (((rewardStatus.rewardUpdatedTime[_index] - rewardStatus.rewardUpdatedTime[0]) / pool.period + 1) * pool.period + rewardStatus.rewardUpdatedTime[0])) / pool.period;
      amount = rewardStatus.rewardUpdatedAmount[_index];
      for(uint256 i=0; i< count; i++) {
        amount = amount.mul(pool.rewardPercent).div(100);
        totalAmount = totalAmount.add(amount);
      }
      amount = (amount * pool.rewardPercent / 100) * (_rewardAt - _basePeriod) / pool.period;
      totalAmount = totalAmount.add(amount);
    }
    return totalAmount;
  }

  function setAdmin(address _admin) external {
    require(
      msg.sender == pool.creator || msg.sender == pool.tokenOwner,
      'caller must be the contract creator or owner to set admin'
    );
    admin = _admin;
  }
}