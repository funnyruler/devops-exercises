import sys
import os
import re
import argparse
import time

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--log_path', '-p', type=str, default='access.log')
    parser.add_argument('--top', '-t', type=int, default=5)
    args = parser.parse_args()
    return args


args = parse_args()
log_path = args.log_path
if not os.path.exists(log_path):
    sys.exit("File does not exist")


def get_data(log_path: str) -> list[str]:
    with open(log_path, 'r', encoding='utf-8') as f:
        data = f.readlines()
    return data


def log_analyser(data: list[str], top_n: int = args.top) -> dict:
    result = {'method_list': {}, 'endpoint_list': {}, 'status_list': {}, 'ip_list': {}}
    pattern = re.compile(r'(?P<ip>\S+) - - \[(.*?)\] "(?P<method>\S+) (?P<endpoint>\S+) \S+" (?P<status>\d+) \d+')
    for line in data:
        match = pattern.search(line)
        if match:
            parsed_data = match.groupdict()
            for key, value in parsed_data.items():
                result[key + '_list'][value] = result[key + '_list'].get(value, 0) + 1
    for r in result:
        result[r] = dict(sorted(result[r].items(), key=lambda x: x[1], reverse=True)[:top_n])
    return result


def print_results(results: dict):
    keys_descriptions = {'ip_list': f'Top {args.top} IP addresses with the most requests:',
                         'method_list': f'Top {args.top} HTTP methods with the most requests:',
                         'endpoint_list': f'Top {args.top} most requested paths:',
                         'status_list': f'Top {args.top} HTTP status codes:'}
    for key, value in results.items():
        row = keys_descriptions.get(key, key)
        print(row)
        for k, v in value.items():
            print(f'{k}: {v} requests')
        print('\n')


if __name__ == '__main__':
    start_time = time.time()
    data = get_data(log_path)
    result = log_analyser(data)
    print_results(result)
    print(f'Analyze completed in {round(time.time() - start_time, 2)} seconds')
