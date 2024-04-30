// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

interface ERC721 {
    /// @dev Emitted when `tokenId` token is transfered from `from` to `to`.
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /// @dev Emitted when `owner` enables `approved` to manage `tokenId` token.
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /// @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /// @dev Returns the number of tokens in ``owner``'s account.
    function balanceOf(address owner) external view returns (uint256 balance);

    /// @dev Returns the owner of the `tokenId` token.
    /// @dev Requirements:
    ///   - `tokenId` must exist.
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /// @dev Safely transfers `tokenId` token from `from` to `to`.
    /// @dev Requirements:
    ///   - `from` cannot be the zero address.
    ///   - `to` cannot be the zero address.
    ///   - `tokenId` token must exist and be owned by `from`.
    ///   - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
    ///   - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;

    /// @dev Transfers `tokenId` token from `from` to `to`.
    /// @dev Requirements:
    ///   - `from` cannot be the zero address.
    ///   - `to` cannot be the zero address.
    ///   - `tokenId` token must be owned by `from`.
    ///   - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /// @dev Gives permission to `to` to transfer `tokenId` token to another account.
    /// @dev Requirements:
    ///   - The caller must own `tokenId` or be an approved operator.
    function approve(address to, uint256 tokenId) external;

    /// @dev Returns the account approved for `tokenId` token.
    /// @dev Requirements:
    ///   - `tokenId` must exist.
    function getApproved(uint256 tokenId) external view returns (address operator);

    /// @dev Approve or remove `operator` as an operator for the caller.
    /// @dev Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
    /// @dev Requirements:
    ///   - The `operator` cannot be the caller.
    function setApprovalForAll(address operator, bool _approved) external;

    /// @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
    /// @dev See {setApprovalForAll}
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /// @dev Safely transfers `tokenId` token from `from` to `to`.
    /// @dev Requirements:
    ///   - `from` cannot be the zero address.
    ///   - `to` cannot be the zero address.
    ///   - `tokenId` token must exist and be owned by `from`.
    ///   - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
    ///   - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
    /// @dev Emits a {Transfer} event.
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;
}
