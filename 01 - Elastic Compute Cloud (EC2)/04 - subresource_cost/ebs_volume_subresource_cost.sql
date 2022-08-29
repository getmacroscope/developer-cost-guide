#Subresource Costs
##Subresource costs for EBS Volumes
SELECT DISTINCT
	[lineItem/ResourceID],
	[lineItem/LineItemType],
	[lineItem/Operation],
	round(sum([lineItem/UnblendedCost]), 4) as subresource_cost
FROM CUR
WHERE
	[lineItem/ProductCode] is 'AmazonEC2'
	and [lineItem/ResourceId] LIKE 'vol-%'
GROUP BY
	[lineItem/ResourceID],
	[lineitem/lineitemtype],
	[lineItem/Operation]
ORDER BY
	sum([lineItem/UnblendedCost]);
