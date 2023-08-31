use array::ArrayTrait;

use metadata::interfaces::component_provider::{
    IComponentProviderDispatcher, IComponentProviderDispatcherTrait
};
use metadata::interfaces::project::{IProjectDispatcher, IProjectDispatcherTrait};
use starknet::get_contract_address;

const ONE_HA_IN_M2: felt252 = 10000;

// TODO: real values here (move?)
const IERC165_ID: u32 = 0x01ffc9a7;
const IERC3525_ID: u32 = 0x0d912442;
const IERC3525_METADATA_ID: u32 = 0x0e89341c;
const IERC721_ID: u32 = 0x80ac58cd;
const IERC721_METADATA_ID: u32 = 0x5b5e139f;

#[inline(always)]
fn get_external_url() -> Span<felt252> {
    let mut a = ArrayTrait::new();
    a.append('https://app.carbonable.io/');
    a.span()
}

#[inline(always)]
fn get_youtube_url() -> Span<felt252> {
    let mut a = ArrayTrait::new();
    a.append('https://youtu.be/5dZrROBmfKU');
    a.span()
}

#[inline(always)]
fn get_banner_img_url() -> Span<felt252> {
    let mut a = ArrayTrait::new();
    a.append('ipfs://Qmdjj76nkc1HQn8Tr3ertWs');
    a.append('9eWkFMBxXQkGwjHEp6mWbig/banner.');
    a.append('png');
    a.span()
}

#[inline(always)]
fn get_provider() -> IComponentProviderDispatcher {
    let project = IProjectDispatcher { contract_address: get_contract_address() };
    let provider = IComponentProviderDispatcher {
        contract_address: project.get_component_provider()
    };
    provider
}
