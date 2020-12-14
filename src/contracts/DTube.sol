pragma solidity 0.6.0;

contract DTube {
    string public name = "DTube";
    uint public videoCount = 0;
    mapping(uint => Video) public videos;

    struct Video {
        uint id;
        string title;
        string hash;
        address author;
    }

    event VideoUploaded (
        uint id, string title, string hash, address author
    );

    constructor() public {   
    }

    function uploadVideo(string memory _videoHash, string memory _title) public {
        require(bytes(_videoHash).length > 0);
        require(bytes(_title).length > 0);
        require(msg.sender!=address(0));
        videoCount++;
        videos[videoCount] = Video(videoCount, _videoHash, _title, msg.sender);
        emit VideoUploaded(videoCount, _videoHash, _title, msg.sender);

    }





}